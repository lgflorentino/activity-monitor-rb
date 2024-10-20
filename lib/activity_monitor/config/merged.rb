# frozen_string_literal: true

require_relative "../errors"
require_relative "../db"

module ActivityMonitor
  module Config 
    class Merged
      include ActivityMonitor::Logging

      def initialize
        @config = AM_CONF.dup
        @finalised = false
        @router, @routes, @db = nil
      end
      

      # Config Hash, try to keep all config settings in this hash. 
      AM_CONF = {
        root_slugs: %w[
          am
        ],
        env: "development",
        enabled_services: {
          bitbucket: {
            slug: "bb"
          },
          codeberg: {
            slug: "cb"
          },
          github: {
            slug: "gh"
          },
          gitlab: {
            slug: "gl"
          },
        },
        trailing_slugs: %w[
          new
        ],
        db_connections: [{
          name: "default",
          connection_string: "sqlite://#{__dir__}/../../../.data/am.db"
        }],
        parent_app: nil,
        user_config_file: Pathname(__FILE__).dirname.join("../../../config/config.rb").realpath
      }

      # no changes to config after this function is called
      def finalise
        unless @finalised
          @config.freeze
          @finalised = true
        end

        self
      end

      def finalised?
        @finalised
      end

      # Guardrail method for modifying config options
      def cfg(*args)
        case args.first
        when :root_slugs || :trailing_slugs
          @config.merge!({args[0] => args[1]})
        when :db
          a = args[1]
          unless ( a.has_key?(:connection_string) || a.has_key?(:options) )
            raise Errors::ActivityMonitorError.new("No 'connection_string' or 'options' key provided")
          end
          
          update = false
          @config[:db_connections].each_with_index do |conn, idx|
            if conn[:name] == a[:name]
              @config[:db_connections][idx] = a
              update = true
            end
          end
          unless update
            @config[:db_connections].push(a);
          end
        when :parent_app
          if args[1] === ("hanami" || "rails" || nil)
            @config.merge!({parent_app: args[1]})
          else
            raise Errors::ConfigurationSettingError.new(cfg_name: :parent_app, cfg_val: args[1])
          end
        when :env
          unless args.length() == 2
            raise Errors::ArgumentLengthError("The cfg method expects 2 arguments for setting 'env' value")
          end

          @config[:env] = args[1]
        end
      end
      
      def dump
        pp @config
      end

      # Sets the config file path where user can define new config.
      def user_config_file=(arg)
        unless arg.is_a?(Pathname)
          raise Errors::TypeError.new("user_config_file setting needs to be a Pathname object")
        end

        @config[:user_config_file] = arg
      end

      def user_config_file
        return @config[:user_config_file]
      end
      

      # Will incorporate settings from the environment. 
      # These settings get overwritten by config from the user defined config file.
      # These settings overwrite the default configuration
      def merge_cfg_from_env(renv: nil)
        if finalised?
          raise Errors::ActivityMonitorError.new("Cannot modify config once it has been finalised.")
        end

        ENABLED_ENV_SETTINGS.each do |s|
          if renv.key?(s.to_s) && ! renv[s.to_s].empty?
            if s == (:AM_ENV || :HANAMI_ENV || :RAILS_ENV || :RACK_ENV)
              @config[:env] = renv[s.to_s]
            else
              @config[s] = renv[s.to_s]
            end
          else
            log.debug "Env var: #{s}, not found or had empty content"
            next
          end
        end
      end

      attr_accessor :finalised, :config
      
      # These can be set in `.env.local`
      ENABLED_ENV_SETTINGS = %i[ 
        DATABASE_URL 
        AM_ENV 
        HANAMI_ENV 
        RAILS_ENV 
        RACK_ENV 
        AM_CONF_FILE
        ENABLE_API_ACCESS
        BB_API_TOKEN
        BB_WH_TOKEN
        CB_API_TOKEN
        CB_WH_TOKEN
        GH_API_TOKEN
        GH_WH_TOKEN
        GL_API_TOKEN
        GL_WH_TOKEN
      ]
    end
  end
end
