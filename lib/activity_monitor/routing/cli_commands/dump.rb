# frozen_string_literal: true

require "dry/cli"

module ActivityMonitor
  module Routing
    module CLICommands
      class Dump < Dry::CLI::Command
        include ActivityMonitor::Logging

        desc "Dump the enabled routes to console."

        def initialize
          super
        end

        def call(*)
          puts "Routes: [name], [slug], [path]\n"
          pp ActivityMonitor.am.routes
        end
      end
    end
  end
end
