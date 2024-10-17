# frozen_string_literal: true

require "json"

module ActivityMonitor
  module Services
    class Bitbucket < ActivityMonitor::Services::Service

      def initialize
        @service_name = "bitbucket"
        @data = {}
      end

      
      # @param [Hash] env
      # @param [Rack::Response] res
      def call(env, res)

        unless verified_sender?(env, res); res; end
        unless check_req_headers(env, res); res; end
        unless process_req_data(env, res); res; end

        res.status=(200)
        res.add_header("Content-Type", "text/html")
        res.body=(["Webhook successfully delivered!"])
      end
      
      def check_req_headers(env, res)
        BB_REQUIRED_HEADERS.each do |h|
          unless env.key?(h)
            log.error("The request was missing a required header: #{h}")
            res.status=(400)
            res.add_header("Content-Type", "text/html")
            res.body=(["Bad Request"])
            return false
          end
        end
        true
      end

      def process_req_data(env, req)
        @data[:type] = env["HTTP_X_EVENT_KEY"]
        @data[:content] = JSON.parse(env["rack.input"].read).to_s
        @data[:created_at] = DateTime.now.iso8601(3)
        @data[:updated_at] = @data[:created_at].dup

        @db_repo.create(**data)
        true
      end
      
      def verified_sender?(env, res)
        unless env.key?("HTTP_X_HUB_SIGNATURE")
          log.error("The X-Hub-Signature authentication header was missing from the request")
          res.status=(400)
          res.add_header("Content-Type", "text/html")
          res.body=(["Bad Request"])
          return false
        end
        true
      end

      BB_HEADERS = %w[ HTTP_X_EVENT_KEY HTTP_X_HOOK_UUID HTTP_X_REQUEST_UUID HTTP_X_ATTEMPT_NUMBER HTTP_X_HUB_SIGNATURE ]
      BB_REQUIRED_HEADERS = %w[ HTTP_X_EVENT_KEY HTTP_X_ATTEMPT_NUMBER HTTP_X_HUB_SIGNATURE ]
      EVENTS_IMPLEMENTED = %w[ repo:push ]
      EVENTS_NOT_IMPLEMENTED = %w[ repo:fork 
                                   repo:updated 
                                   repo:transfer 
                                   repo:commit_comment_created 
                                   repo:commit_status_created 
                                   repo:commit_status_updated 
                                   issue:created 
                                   issue:updated 
                                   issue:comment_created 
                                   pullrequest:created 
                                   pullrequest:updated 
                                   pullrequest:changes_request_created 
                                   pullrequest:changes_request_removed 
                                   pullrequest:approved 
                                   pullrequest:unapproved 
                                   pullrequest:fulfilled 
                                   pullrequest:rejected 
                                   pullrequest:comment_created 
                                   pullrequest:comment_updated 
                                   pullrequest:comment_deleted 
                                   pullrequest:comment_resolved 
                                   pullrequest:comment_reopened
      ]
    end
  end
end
