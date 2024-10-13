# frozen_string_literal: true

module ActivityMonitor
  module Routing
    module Routes


      # Constructs an array of routes the app will respond to based on the
      # settings in config/base_config.rb
      #
      def as_array(rs, svcs, ts)
        routes = []
        prefix = ""
        suffix = ""

        rs.each do |rs|
          s = rs.dup
          s.gsub!(%r{^/|$?/}, "")
          prefix += "/" + s
        end

        ts.each do |ts|
          s = ts.dup
          s.gsub!(%r{^/|$?/}, "")
          suffix += "/" + s
        end

        svcs.each do |svc|
          path = prefix + "/" + svc[1][:slug] + suffix

          routes << [svc[0], svc[1][:slug], path]
        end

        routes
      end

      def to_s
        "Need to implement this"
      end

      module_function :as_array
    end
  end
end
