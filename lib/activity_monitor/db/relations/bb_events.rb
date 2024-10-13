# frozen_string_literal: true

require "rom-sql"

module ActivityMonitor
  module DB
    module Relations
      class BBEvents < ROM::Relation[:sql]
        schema(:bb_events, infer: true)

        auto_struct(true)
      end
    end
  end
end
