# frozen_string_literal: true

require "rom"
require "rom-sql"

module ActivityMonitor
  module DB
    module Relations
     class Events < ROM::Relation[:sql]
     end
    end
  end
end
