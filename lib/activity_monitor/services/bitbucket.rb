# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Bitbucket < ActivityMonitor::Services::Service

      def initialize
        @service_name = "bitbucket"
      end
    end
  end
end
