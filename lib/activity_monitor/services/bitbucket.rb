# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Bitbucket < ActivityMonitor::Services::Service

      def initialize
        @service_name = "bitbucket"
      end

      def process_event(db_repo, event, content)
        dt = DateTime.now.iso8601(3)
        db_repo.create(type: "push", content: content.to_json, created_at: dt, updated_at: dt) 
      end

    end
  end
end
