# frozen_string_literal: true

module ActivityMonitor
  class HanamiApp
    include ActivityMonitor::Logging

    def initialize(app, _name = nil)
      @app = app
      @am_config = ActivityMonitor::Config.new
      log.info("Hanami App Initialized")
      # @hanami_config = ::Hanami::app::config
    end

    def call(env)
      log.info @app.to_s
      if env["REQUEST_PATH"] == "/activity_monitor"
        [200, {"Content-Type" => "text/html"}, ["Hello from activity monitor "]]
      end
      _, _, _ = response = @app.call(env)
      response
    end

    def set_config(key, val)
      @am_config.public_send(key, val)
    end
  end
end
