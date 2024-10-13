# frozen_string_literal: true

rom = ActivityMonitor::DB.prepare()

bb_repo = ActivityMonitor::DB::Repos::BBRepo.new(rom)
cb_repo = ActivityMonitor::DB::Repos::CBRepo.new(rom)
gh_repo = ActivityMonitor::DB::Repos::GHRepo.new(rom)
gl_repo = ActivityMonitor::DB::Repos::GLRepo.new(rom)
sh_repo = ActivityMonitor::DB::Repos::SHRepo.new(rom)

def get_random_bb_event 
  dt = DateTime.now.iso8601(3)
  return {
    type: "commit",
    content: %`"{ "commit-hash": skdjhbsdhbshdbhjfbjkhsd2398293hn23hg23yuh327, "test": [ name, test, static] "} "}`,
    created_at: dt,
    updated_at: dt,
  }
end

bb_repo.create(get_random_bb_event)

