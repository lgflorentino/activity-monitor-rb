# frozen_string_literal: true

require "json"

module ActivityMonitor
  module Routing
    class DefaultRouter
      include ActivityMonitor::Logging
      
      def initialize(routes)
        @routes = routes.routes

        puts "Router intialized of type: Default"
      end

      def process_request(*args, **kws, &blk)
        log.debug "process_request: args => #{JSON.pretty_generate(args)}, kws => #{kws}"
        
        log.debug "@routes: #{@routes}"
        matched = false
        path_info = args[0]["PATH_INFO"].to_s

        # match the route path then match the service slug based on a Regexp
        # dispatch the call to the service callback
        @routes.each do |route|
          log.debug "Matching #{route} with #{path_info}"
          if route[2] === path_info
            slug_re = /^*\/#{route[1]}\/*/
            if slug_re.match?(path_info)
              matched = true
              return invoke_callback(route[0])
            end 
          end
        end

        return [404, {"Content-Type" => "text/html"}, ["Not Found"]] unless matched
      end

      # Selects the object and method to call based on the endpoint 
      #
      # @param service - the service name as specified in config/am.conf.rb
      def invoke_callback(service)

        return [200, {"Content-Type" => "text/html"}, ["Name: #{service}"]]
      end
    end
  end
end
