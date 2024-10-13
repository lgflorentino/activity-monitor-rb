# frozen_string_literal: true

module ActivityMonitor
  module Config
    require_relative "config/merged.rb"
      
    def self.merge!(&blk)
      blk&.call(@am_config)
    end

    def self.new(renv: ENV, path: nil)
      if instance_variable_defined?(:@am_config)
        @am_config = nil
      end
      @am_config = ActivityMonitor::Config::Merged.new
      @am_config.merge_cfg_from_env(renv: renv)

      if path.nil? || path.empty?
        require @am_config.config[:user_config_file]
      else
        @am_config.user_config_file= path
        require @am_config.config[:user_config_file]
      end
      @am_config.finalise
      @am_config
    end
  end
end
