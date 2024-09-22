# frozen_string_literal: true

module ActivityMonitor
  class App
    include ActivityMonitor::Logging

    def initialize
      @am_config = ActivityMonitor::Config.new
      @router = ActivityMonitor::Router.select_router
      @routes = ActivityMonitor::Router::Routes.new
      log.info("Initialized")
      # @hanami_config = ::Hanami::app::config
    end

    def call(env)
      if env["REQUEST_PATH"] == "/activity_monitor"
        [200, {"Content-Type" => "text/html"}, ["Hello from activity monitor"]]
      end
    end

    def set_config(key, val)
      @am_config.public_send(key, val)
    end

    def dump_config
      @am_config.dump
    end

    def say_hello
      puts "Hello from #{self}"
    end
  end
end
