# frozen_string_literal: true

module ActivityMonitor
  module Routing
    class Routes
      include ActivityMonitor::Logging

      attr_accessor :routes

      # @param rs - root_slug ex: /am
      # @param svcs - services ex: /bitbucket
      # @param ts - trailing_slug ex: /webhooks/new
      def initialize(rs, svcs, ts)
        @rs = rs
        @svcs = svcs
        @ts = ts
        @routes = []
        
        construct_routes
      end

      # Constructs an array of routes the app will respond to based on the
      # settings in $PROJECT_ROOT/config/am.conf.rb
      #
      def construct_routes
        prefix = ""
        suffix = ""

        @rs.each do |rs|
          s = rs.dup
          s.gsub!(/^\/|$?\//, '')
          prefix += "/" + s
        end

        @ts.each do |ts|
          s = ts.dup
          s.gsub!(/^\/|$?\//, '')
          suffix += "/" + s
        end
        
        @svcs.each do |svc|
          path = prefix + "/" + svc[1][:slug] + suffix 

          @routes << [svc[0], svc[1][:slug], path]
        end
      end

    end
  end
end
