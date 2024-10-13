# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Service
      include ActivityMonitor::Logging

     SERVICE_NAME = "super"

      def initialize()
      end

      def call(*args, **kws, &blk); end

      def commit; end

      def process(subclass, content)
      end

    end
  end
end
