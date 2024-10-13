# frozen_string_literal: true

module ActivityMonitor
  module Config 

    class Merged < Base

      def initialize
        @config = AM_CONF.dup
        @finalised = false
        @router, @routes, @db = nil
      end
      
      def user_config_file=(arg)
        unless arg.is_a?(Pathname)
          raise Errors::TypeError.new("user_config_file setting needs to be a Pathname object")
        end

        @config[:user_config_file] = arg
      end

      def user_config_file
        return @config[:user_config_file]
      end
      
      ENABLED_ENV_SETTINGS = %i[ DATABASE_URL HANAMI_ENV AM_ENV RAILS_ENV RACK_ENV]

      # Will incorporate settings from the environment. 
      # These settings get overwritten by config from the user defined config file.
      # These settings overwrite the default configuration
      def merge_cfg_from_env(renv: nil)
        if finalised?
          raise Errors::ActivityMonitorError.new("Cannot modify config once it has been finalised.")
        end

        ENABLED_ENV_SETTINGS.each do |s|
          if renv.key?(s.to_s) && ! ( renv[s.to_s].empty? || renv[s.to_s].nil? )
            case s
            when :DATABASE_URL
              @config[:db_url] = renv[s.to_s]
            when :AM_ENV || :HANAMI_ENV || :RAILS_ENV || :RACK_ENV
              @config[:env] = renv[s.to_s]
            end
          end
        end
      end

      attr_accessor :finalised, :config
      
    end
  end
end
