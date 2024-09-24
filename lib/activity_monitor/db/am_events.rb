# frozen_string_literal: true

require "rom"
require "rom-sql"

module ActivityMonitor
  module DB
    class AMEvents < ROM::Relation[:sql]
    
      schema(infer: true)
      def initialize
      end
    end
  end
end
