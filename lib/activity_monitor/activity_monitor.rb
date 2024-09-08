# frozen_string_literal: true

module ActivityMonitor
  class ActivityMonitor

    def initialize()
    end

    def self.env(e: ENV)
      return e["RUBY_MAJOR"]
    end
  end
end
