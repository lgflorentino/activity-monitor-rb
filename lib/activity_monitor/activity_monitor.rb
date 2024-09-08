# frozen_string_literal: true

module ActivityMonitor
  class ActivityMonitor

    def initialize()
    end

    def self.env(e: ENV)
      puts e
      return e
    end
  end
end
