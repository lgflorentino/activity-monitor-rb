# frozen_string_literal: true

require "bundler"
Bundler.require(:db_sqlite_backend)
require "rom"

module ActivityMonitor
  module DB
    class SQLite

      def initialize(db_conn_uri)
        @config = ROM::Configuration.new(:sql, db_conn_uri)
        @config.default.create_table(:am_events) do
          primary_key :id
          column :service, String, null: false
          column :content, String, null: false
        end

        @config.register_relation(AMEvents)
        @cont = ROM.container(@config)
        @repo = AMRepo.new(@cont)
      end
    end
  end
end
