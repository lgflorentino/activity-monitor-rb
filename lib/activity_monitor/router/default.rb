# frozen_string_literal: true

module ActivityMonitor
  module Router
    class Default
      def initialize
        puts "Router intialized of type: Default"
      end

      def process_route(_routes)
        puts "process_route"
      end
    end
  end
end
