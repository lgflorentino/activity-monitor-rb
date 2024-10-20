# frozen_string_literal: true

require "rack"

module ActivityMonitor
  module Routing
    class DefaultRouter
      include ActivityMonitor::Logging

      def initialize(routes: nil, services: nil)
        @routes = routes
        @services = services
      end

      attr_accessor :routes, :services

      def match_request(env)
        path_info = env["PATH_INFO"].to_s

        res = Rack::Response[500, {"Content-Type" => "text/html"}, ["The activity_monitor server encountered an error"]]
        matched = false
        # match the route path then match the service slug based on a Regexp
        # dispatch the call to the service callback
        @routes.each do |route|
          # route = [ :symbol_name, service_slug, full_path ]
          log.debug "Matching #{route} with #{path_info}"
          if route[2] === path_info
            slug_re = %r{^*/#{route[1]}/*}
            if slug_re.match?(path_info)
              @services[route[0]].call(env, res)
              log.debug "Matched request: #{route[0]} with #{path_info}"
              matched = true
              break
            end
          end
        end

        unless matched
          res.status=(404)
          res.body=("Not Found")
        end
        
        res.finish
      end

    end
  end
end
