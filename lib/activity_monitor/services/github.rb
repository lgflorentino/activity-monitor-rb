# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Github < ActivityMonitor::Services::Service
      def initialize
        @service_name = "github"
      end

    end
  end
end
