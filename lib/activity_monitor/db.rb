# frozen_string_literal: true

require "rom"

module ActivityMonitor
  module DB

    def prepare(cfg: nil)

      rom_cfg = ROM::Configuration.new(:sql, cfg)

      rom_cfg.register_relation(ActivityMonitor::DB::Relations::BBEvents)
      rom_cfg.register_relation(ActivityMonitor::DB::Relations::CBEvents)
      rom_cfg.register_relation(ActivityMonitor::DB::Relations::GHEvents)
      rom_cfg.register_relation(ActivityMonitor::DB::Relations::GLEvents)
      rom_cfg.register_relation(ActivityMonitor::DB::Relations::SHEvents)
      rom = ROM.container(rom_cfg)
      rom
    end

    module_function :prepare
  end
end
