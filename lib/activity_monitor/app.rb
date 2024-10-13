# frozen_string_literal: true

module ActivityMonitor
  class App
    include Logging

    def initialize
      # App instance vars
      @am_config = init_config
      @db = init_db(cfg: @am_config[:db_url])
      @services = init_services(db: @db, cfg: @am_config)
      @router = init_router
      log.info("Initialized")
    end

    def call(...)
      @router.match_request(...)
    end

    # init_config
    def init_config
      ActivityMonitor::Config.new.config
    end

    def init_db(cfg: nil)
      DB.prepare(cfg: cfg)
    end

    def init_services(db: nil, cfg: nil)
      svcs = {}
      cfg[:enabled_services].each do |s|
        svcs[s[0]] = ActivityMonitor::Services.get_service(s[0])
        svcs[s[0]].db_setup(db: db)
      end
      svcs
    end

    def init_router
      routes = Routing::Routes.as_array(
        @am_config[:root_slugs],
        @am_config[:enabled_services],
        @am_config[:trailing_slugs])
      Routing::DefaultRouter.new(services: @services, routes: routes)
    end

    def dump_config
      @am_config.dump_to_console
    end
  
    def routes
      @router.routes
    end

    attr_accessor :am_config, :db
  end
end
