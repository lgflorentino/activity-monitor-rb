# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Codeberg < ActivityMonitor::Services::Service

      def initialize
        @service_name = "codeberg"
      end
    end
  end
end
