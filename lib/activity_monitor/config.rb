#frozen_string_literal: true

module ActivityMonitor
  class Config
    attr_accessor :is_hanami_app, :root_slug
    
    def initialize
      self.reset_config
      @root_slug = "/activity_monitor"
    end
    
    def reset_config
      @is_hanami_app = false
      @root_slug = "/activity_monitor"
    end
    
  end
end

