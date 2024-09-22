# frozen_string_literal: true

require_relative("#{__dir__}/../../config/am.conf.rb")

module ActivityMonitor
  class Config
    attr_accessor :is_hanami_app, :root_slug, :router

    def initialize
      reset_config
    end

    def dump
      ivars = instance_variables

      ivars.each do |v|
        p v.to_s.ljust(20) + "=> #{instance_variable_get(v)}"
      end
    end

    private

    def reset_config
      @is_hanami_app = false
      @root_slug = AM_CONF[:root_slug]
      @router = ActivityMonitor::Router.select_router
    end
  end
end
