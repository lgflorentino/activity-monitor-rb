# frozen_string_literal: true

module ActivityMonitor
  class ActivityMonitor

    def initialize()
      puts ENV.keys
    end
  end

  def self.env(e: ENV)
    return e
  end
end
