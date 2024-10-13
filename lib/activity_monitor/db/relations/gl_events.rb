# frozen_string_literal: true

require "rom"
require "rom-sql"

module ActivityMonitor
  module DB
    module Relations
      class GLEvents < ROM::Relation[:sql]
        schema(:gl_events, infer: true)
      end
    end
  end
end
