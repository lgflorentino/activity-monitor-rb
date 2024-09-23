# frozen_string_literal: true

module ActivityMonitor
  class App
    include ActivityMonitor::Logging

    def initialize
      @am_config = ActivityMonitor::Config.instance
    
      log.info("Initialized")
      # @hanami_config = ::Hanami::app::config
    end

    def call(...)
      log.debug "-> #{self}.call"
      log.debug "<- #{self}.call"
      @am_config.router.process_request(...)
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
