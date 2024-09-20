#frozen_string_literal: true

require "logger"

module ActivityMonitor
  module Logging
    class Logger < Logger

      def initialize(*args)
        super

        @level = defined?(env["RUBY_LOG_LEVEL"]) ? env["RUBY_LOG_LEVEL"] : Logger::DEBUG
      
        formatter = ActivityMonitor::Logging::Formatter.new

        @progname = "AM"
      
        @formatter = proc { |severity, datetime, progname, msg|
          formatter.call(severity, datetime, progname, msg.dump)
        }
      end

    end
  end
end
