# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Service
      include ActivityMonitor::Logging

      NAME = "DefaultService"

      def initialize
      end

      def call(*args, **kws, &blk)
      end

      def commit
      end

    end
  end
end
