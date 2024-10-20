# frozen_string_literal: true

require "logger"

module ActivityMonitor
  module Logging
    class Logger < Logger
      def initialize(*args)
        super

        @level = defined?(ENV["RUBY_LOG_LEVEL"]) ? ENV["RUBY_LOG_LEVEL"].to_i : Logger::WARN

        # formatter = ActivityMonitor::Logging::Formatter.new

        @progname = "AM"

        # @formatter = proc { |severity, datetime, progname, msg|
        #  formatter.call(severity, datetime, progname, msg.dump)
        # }
      end
    end
  end
end
