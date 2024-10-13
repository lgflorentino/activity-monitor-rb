# frozen_string_literal: true

require "rom"
require "rom-sql"

module ActivityMonitor
  module DB
    module Relations
      class SHEvents < ROM::Relation[:sql]
        schema(:sh_events, infer: true)
      end
    end
  end
end
