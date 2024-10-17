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

      attr_accessor :routes, :db_conn, :services

      def match_request(*args, **kws)
        path_info = args[0]["PATH_INFO"].to_s

        res = Rack::Response[500, {"Content-Type" => "text/html"}, ["The activity_monitor server encountered an error"]]

        # match the route path then match the service slug based on a Regexp
        # dispatch the call to the service callback
        @routes.each do |route|
          log.debug "Matching #{route} with #{path_info}"
          if route[2] === path_info
            slug_re = %r{^*/#{route[1]}/*}
            if slug_re.match?(path_info)
              @services[route[0]].call(args[0], res)
              log.debug "Matched request: #{route[0]} with #{path_info}"
              break
            end
          end
        end
        
        res.finish
      end

    end
  end
end
