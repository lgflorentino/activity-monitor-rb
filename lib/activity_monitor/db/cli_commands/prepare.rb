# frozen_string_literal: true

require "dry/cli"

module ActivityMonitor
  module DB
    module CLICommands
      class Prepare < Dry::CLI::Command
        desc "Prepare the database for use with Activity Monitor"

        def initialize
          super
        end

        def call(*)
          puts "write the prepare command"
        end
      end
    end
  end
end
