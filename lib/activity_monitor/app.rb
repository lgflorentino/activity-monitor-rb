# frozen_string_literal: true

module ActivityMonitor
  class App
    include Logging

    def initialize
      # App instance vars
      @router = nil
      @am_config = init_config
      @db_cfg = init_db
      @services = init_services(db: @db_cfg, cfg: @am_config)
      @router = init_router(@services)
      @router = Routing::DefaultRouter.new
      @router.routes = Routing::Routes.as_array(
        @am_config.config[:root_slugs],
        @am_config.config[:enabled_services],
        @am_config.config[:trailing_slugs])
      @rom = DB.prepare
      log.info("Initialized")
    end

    def call(...)
      @router.match_request(...)
    end

    def init_config
      ActivityMonitor::Config.new.config
    end

    def init_db()
      DB.prepare
    end

    def init_services(db: nil, cfg: nil)
      s = cfg[:enabled_services]
      log.debug s.to_s
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
