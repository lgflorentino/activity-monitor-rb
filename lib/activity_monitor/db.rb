# frozen_string_literal: true

require "rom"

module ActivityMonitor
  module DB
    
    def prepare(db_cfgs: nil)
      rom_cfgs = {}

      db_cfgs.each do |conn|
        if conn.key?(:connection_string) && conn.key?(:options) && conn[:options].key?(:adapter)
          raise Errors::ActivityMonitorError("DB configuration will not accept ':connection_string' & ':options => :adapter' settings. Please remove one or the other")
        end

        if conn.key?(:connection_string) && conn.key?(:options)
          rom_cfgs[conn[:name].to_sym] = [:sql, conn[:connection_string], conn[:options]]
        elsif conn.key?(:connection_string) && ! conn.key?(:options)
          rom_cfgs[conn[:name].to_sym] = [:sql, conn[:connection_string]]
        elsif ! conn.key?(:connection_string) && conn.key?(:options)
          rom_cfgs[conn[:name].to_sym] = [:sql, conn[:options]]
        else
          raise Errors::DBConnectionError.new("Unkown combination of config for the DB. Please check your config snippet...")
        end

      end

      rom = ROM.container(rom_cfgs) do |config|
        config.register_relation(ActivityMonitor::DB::Relations::BBEvents)
        config.register_relation(ActivityMonitor::DB::Relations::CBEvents)
        config.register_relation(ActivityMonitor::DB::Relations::GHEvents)
        config.register_relation(ActivityMonitor::DB::Relations::GLEvents)
      end

      rom
    end

    module_function :prepare
  end
end
