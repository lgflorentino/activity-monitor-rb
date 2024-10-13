# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Gitlab < ActivityMonitor::Services::Service

      def initialize
        @service_name = "gitlab"
      end
    end
  end
end
