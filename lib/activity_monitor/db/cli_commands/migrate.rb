# frozen_string_literal: true

require "dry/cli"

module ActivityMonitor
  module DB
    module CLICommands
      class Migrate < Dry::CLI::Command
        include ActivityMonitor::Logging

        desc "Run migrations necessary to get the app to work from a new install"

        def initialize
          super
        end

        def call(*)
          log.debug "db migrate cli command #{@db_config.db}"
        end
      end
    end
  end
end
