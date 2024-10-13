# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Service
      include ActivityMonitor::Logging

     SERVICE_NAME = "super"

      def initialize()
      end

      def call(*args, **kws, &blk); end

      def db_setup(db: nil)
        @repo = DB::Repos::BBRepo.new(db)
      end

      def process_event(content)
        dt = DateTime.now.iso8601(3)
        @repo.create(type: "push", content: content.to_json, created_at: dt, updated_at: dt) 
      end

    end
  end
end
