# frozen_string_literal: true

require "rom"
require "rom-sql"

module ActivityMonitor
  module DB
    module Relations
      
      class CBEvents < ROM::Relation[:sql]
        schema(:cb_events, infer: true)
      end
    end
  end
end
