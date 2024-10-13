# frozen_string_literal: true

require "dry/cli"

module ActivityMonitor
  module DB
    module CLICommands
      class Drop < Dry::CLI::Command
        desc "Drop the database and all associated data. "

        def intialize
          super
        end

        def call(*)
          puts "Do you really want to drop the database ? (y/n)"
          confirm = STDIN.gets.chomp
          if confirm == "y"
            drop_db
          else
            exit
          end
        end

        def drop_db
          puts "write the drop_db method"
        end
      end
    end
  end
end
