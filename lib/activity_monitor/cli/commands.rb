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
          puts ActivityMonitor.version_string
        end
      end
    
      # Generators for creating files on disk
      module Generate
        class HanamiProvider < Dry::CLI::Command
          desc "Generates a basic provider file for the Hanami framework"

          HANAMI_PROVIDER_PATH = "/config/providers"

          def initialize(filename: "activity_monitor", extension: "rb")
            super
            @filename = "#{filename}.#{extension}" # the provider defintion file that will be saved
          end

          def call(*)
            dir_path = Dir.pwd + HANAMI_PROVIDER_PATH # directory that contains the provider file
            unless Dir.exist?(dir_path)
              raise StandardError.new(
                "Directory not found: #{dir_path}\n\tCurrent Directory: #{Dir.pwd}"
              )
            end

            t = ActivityMonitor::Templates::HanamiProvider.new
            file_path = dir_path + @filename # full path to the file
            unless File.exist?(file_path)
              raise FileExistsError.new(file_path)
            end

            puts t.template #TODO make this a file 
          end
        end
      end

      module DB
        class Migrate < Dry::CLI::Command
          desc "Run migrations necessary to get the app to work from a new install"

          def initialize
            super
          end

          def call(*)
            puts "write the command"
          end
        end

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
            
          end
        end

        class Prepare < Dry::CLI::Command
          desc "Prepare the database for use with Activity Monitor"

          def initialize 
             super
          end

          def call(*)
            puts "write the command"
          end
        end
      end

      module Run
        class Run < Dry::CLI::Command
          desc "\n\n  Do not use 'am run' if using AM as a middleware or plugin. 
  Runs the app in standalone mode as a Rack app with `rackup` without any 
  middleware integrations for other frameworks. 
  The internal implementations used in standalone mode are 
  replaced by components provided by the framework when run as a middleware.\n"
          
          option :host, aliases: ["--host"], default: "localhost", desc: "host for the rackup server to listen on"
          option :port, aliases: ["--port"], default: 9292, desc: "port for the rackup server to listen on"

          def initialize 
            super
          end

          def call(host:, port:, **)
            system("rackup  --host #{host.inspect} --port #{port.inspect}")
          end
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]
      register "generate", aliases: ["gen"] do |prefix|
        prefix.register "hanami-provider", Generate::HanamiProvider
      end
      register "db", aliases: ["database"] do |prefix|
        prefix.register "migrate", DB::Migrate
        prefix.register "drop", DB::Drop
        prefix.register "prepare", DB::Prepare
      end
      register "run", Run::Run, aliases: ["r", "-r", "--run"]
    end
  end
end

Dry::CLI.new(ActivityMonitor::CLI::Commands).call
