# frozen_string_literal: true

module ActivityMonitor
  module Config
    require_relative "config/merged.rb"
 
    # The user supplied config file should call this method. 
    # The method will pass the current config to the Proc instance in the user supplied file
    # The Proc will then call the cfg method on the config object which will update the values on it.
    #
    # @param [Proc] a block defined in another file which will get called here
    #
    # @returns [nil] updates the object passed to it.
    def self.merge!(&blk)
      blk&.call(@am_config)
    end

    # Returns a new config Hash object
    #
    # @param renv [Object] an environment object containing the environment variables
    # @param cfg_file [String] a relative path to a user supplied config file. The reference config file is in 
    # config/config.rb. The path is relative to the directory returned by Dir.pwd
    #
    # @returns [ActivityMonitor::Config::Merged] default, user supplied and environment config merged into a single object. An underlying Hash stores the data. Use the accessor for @config to get it
    def self.new(renv: ENV, cfg_file: nil)
      if instance_variable_defined?(:@am_config)
        @am_config = nil
      end
      @am_config = ActivityMonitor::Config::Merged.new
      @am_config.merge_cfg_from_env(renv: renv)

      if cfg_file.nil? || cfg_file.empty?
        require @am_config.config[:user_config_file]
      else
        @am_config.user_config_file= cfg_file
        require @am_config.config[:user_config_file]
      end
      @am_config.finalise
      @am_config
    end

    def self.am_config
      @am_config
    end

  end
end
