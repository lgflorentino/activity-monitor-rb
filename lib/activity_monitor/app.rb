# frozen_string_literal: true

module ActivityMonitor
  class App

    include ActivityMonitor::Logging

    def initialize
      @am_config = ActivityMonitor::Config::new
      log.info("Initialized")
      # @hanami_config = ::Hanami::app::config
    end

    def call(env)
      log.info "#{env}"
      if env['REQUEST_PATH'] == "/activity_monitor"
        ['200', {'Content-Type' => 'text/html'}, ["Hello from activity monitor "]]
      end
    end

    def self.env(e: ENV)
      return e
    end

    def set_config(key, val)
      @am_config.public_send(key, val)
    end

    def self.dump_config()
      # puts "Hanami defined: #{defined?(Hanami)}"
      #puts "prepared: #{::Hanami::app::prepared?}"
      # puts "Hanami config: " + ::Hanami::app::config.to_s + " anything?>"
    end

    def say_hello
      puts "Hello from #{self.to_s}"
    end
  end
end
