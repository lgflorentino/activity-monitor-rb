# frozen_string_literal: true

require_relative("#{__dir__}/../../config/am.conf.rb")

module ActivityMonitor
  class Config

    attr_accessor :is_hanami_app, :root_slugs, :services, :trailing_slugs, :router, :routes, :db
    
    @instance_mutex = Mutex.new
    private_class_method :new

    def initialize
      reset_config
    end

    def self.instance
      return @instance if @instance

      @instance_mutex.synchronize do
        @instance ||= new
      end
      
      @instance
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
      @root_slugs = AM_CONF[:root_slugs]
      @services = AM_CONF[:enabled_services]
      @trailing_slugs = AM_CONF[:trailing_slugs]
      @db = ActivityMonitor::DB::Connection.new(db_conn_str: AM_CONF[:db_url])
      @routes = ActivityMonitor::Routing::Routes.new(@root_slugs, @services, @trailing_slugs)
      @router = ActivityMonitor::Routing::DefaultRouter.new(@routes)

    end
  end
end
