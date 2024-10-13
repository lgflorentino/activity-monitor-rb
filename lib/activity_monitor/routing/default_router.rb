# frozen_string_literal: true

require "json"

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
        resp = [404, {"Content-Type" => "text/html"}, ["Not Found"]]

        # match the route path then match the service slug based on a Regexp
        # dispatch the call to the service callback
        @routes.each do |route|
          log.debug "Matching #{route} with #{path_info}"
          if route[2] === path_info
            slug_re = %r{^*/#{route[1]}/*}
            if slug_re.match?(path_info)
              resp = process_request(route[0], env: args[0])
              break
            end
          end
        end

        return resp
      end

      # Selects the object and method to call based on the endpoint
      #
      # @param service - the service name as specified in config/base_config.rb
      def process_request(service, env: nil)
        json = JSON.parse env['rack.input'].read
          @services[service].process_event(json)
        resp = [200, {"Content-Type" => "text/html"}, ["Webhook delivered!"]]
        return resp
      end
    end
  end
end
