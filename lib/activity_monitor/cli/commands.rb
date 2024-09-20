# frozen_string_literal: true

require "bundler/setup"
require "dry/cli"

module ActivityMonitor

  # ActivityMonitor::CLI provides the `bundle exec am` command line interface
  module CLI
    module Commands

      extend Dry::CLI::Registry

      class Version < Dry::CLI::Command
        desc "Prints the version of Activity Monitor"

        def call(*)
          puts "#{ActivityMonitor.version_string}"
        end
      end

      module Generate

        class HanamiProvider < Dry::CLI::Command
          desc "Generates a basic provider file for the Hanami framework"

          def call(*)
            puts "in HanamiProvider"
          end
        end
      end
      
      register "version", Version, aliases: ["v", "-v", "--version"]

      register "generate", aliases: ["gen"] do |prefix|
        prefix.register "hanami-provider", Generate:HanamiProvider
      end
    end
  end
end

Dry::CLI::new(ActivityMonitor::CLI::Commands).call
