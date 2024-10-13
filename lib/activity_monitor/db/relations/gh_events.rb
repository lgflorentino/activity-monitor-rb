# frozen_string_literal: true

require "rom"
require "rom-sql"

module ActivityMonitor
  module DB
    module Relations
      class GHEvents < ROM::Relation[:sql]
        schema(:gh_events, infer: true)
      end
    end
  end
end
