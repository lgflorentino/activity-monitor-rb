# frozen_string_literal: true

require "bundler/setup"
require "dry/cli"
require "activity_monitor"

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
          
          HANAMI_PROVIDER_PATH = "/config/providers"

          def initialize(filename: 'activity_monitor', extension: 'rb')
            
            @filename = filename + '.' + extension # the provider defintion file that will be saved 
          end
          
          def call(*)
            
            dir_path = Dir.pwd + HANAMI_PROVIDER_PATH # directory that contains the provider file
            unless Dir.exist?(dir_path) 
              raise StandardError.new("Directory not found: #{dir_path}\n\tCurrent Directory: #{Dir.pwd}")
            end

            t = ActivityMonitor::Templates::HanamiProvider.new
            file_path = dir_path + @filename # full path to the file
            unless File.exist?(file_path)
              raise FileExistsError.new(file_path)
            end

            puts "#{t.template}"

          end
        end
      end
      
      register "version", Version, aliases: ["v", "-v", "--version"]

      register "generate", aliases: ["gen"] do |prefix|
        prefix.register "hanami-provider", Generate::HanamiProvider
      end

    end
  end
end

Dry::CLI::new(ActivityMonitor::CLI::Commands).call
