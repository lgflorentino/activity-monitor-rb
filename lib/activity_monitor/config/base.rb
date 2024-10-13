# frozen_string_literal: true

# Required files to enable config to be setup without full app running
require "activity_monitor/errors"
require "activity_monitor/db"

module ActivityMonitor
  module Config
    class Base

      # Config Hash, try to keep all config settings in this hash. 
      AM_CONF = { # endpoint composition `/:am_slugs/:service_slug/:trailing_slugs`
        root_slugs: %w[
          am
        ],
        env: "development",
        enabled_services: {
          bitbucket: {
            slug: "bb",
            secret: nil
          },
          codeberg: {
            slug: "cb",
            secret: nil
          },
          github: {
            slug: "gh",
            secret: nil
          },
          gitlab: {
            slug: "gl",
            secret: nil
          },
          sourcehut: {
            slug: "sh",
            secret: nil
          }
        },
        trailing_slugs: %w[
          new
        ],
        db_url: "sqlite://#{__dir__}/../../../.data/am.db",
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
          @config.merge!(:db_url => args[1])
        when :bitbucket_secret
          @config[:enabled_services][:bitbucket][:secret] = args[1]
        when :codeberg_secret
          @config[:enabled_services][:codeberg][:secret] = args[1]
        when :github_secret
          @config[:enabled_services][:github][:secret] = args[1]
        when:gitlab_secret
          @config[:enabled_services][:gitlab][:secret] = args[1]
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
      
      def dump_to_console
        pp @config
      end

      


      # updates the internal configuration not accessible to the user
      #def configure_internal_components
      #  @db = ActivityMonitor::DB.select_connection(:sql, conn_str: @config[:db_url])
      #  @am_default_routes = ActivityMonitor::Routing::Routes.as_array(@config[:root_slugs], @config[:enabled_services], @config[:trailing_slugs])
      #  unless @router 
      #    @router = ActivityMonitor::Routing::DefaultRouter.new
      #  end
      #
      #  @router.routes=(@am_default_routes)
      #end
    
    end
  end
end
