# frozen_string_literal: true

module ActivityMonitor
  module Router
    class Routes
      def initialize
        puts "Router intialized of type: Default"
      end

      def process_route(routes)
        puts "process_route #{routes}"
      end
    end
  end
end
