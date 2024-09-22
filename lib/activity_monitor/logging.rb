# frozen_string_literal: true

module ActivityMonitor
  module Logging
    def log
      Logging.log
    end

    def self.log
      @log ||= Logging::Logger.new($stdout)
    end
  end
end
