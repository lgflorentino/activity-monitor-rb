# frozen_string_literal: true

require "dry/cli"

module ActivityMonitor
  module DB
    module CLICommands
      class Query < Dry::CLI::Command
        include Logging
        desc "Query the database"

        def initialize
          super
        end

        def call(str)
          am = ActivityMonitor.am
          @config = am.config
          
          repo = @config.db.repo
          log.info %[db : #{repo.query(service: "bitbucket").to_a}]
        end
      end
    end
  end
end
