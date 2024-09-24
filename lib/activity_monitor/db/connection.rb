# frozen_string_literal: true

require "uri"

module ActivityMonitor
  module DB
    class Connection
      include ActivityMonitor::Logging

      attr_accessor :db_conn

      def initialize(db_conn_str:)
        log.debug %[DB Connection String: "#{db_conn_str}"]
        
        @db_conn_uri = URI(db_conn_str)
        
        case @db_conn_uri.scheme
        when "sqlite"
          connect_sqlite(@db_conn_uri)
        when "postgresql"
          connect_pgsql(@db_conn_uri)
        else
        end
      end

      def connect_sqlite(db_conn_uri)
        log.debug "Connecting to #{db_conn_uri.scheme}"
        @db_conn = ActivityMonitor::DB::SQLite.new(db_conn_uri)
      end

      def connect_pgsql(db_conn_uri)
        log.debug "connect_postgresql stub for #{self.to_s}"
        @db_conn = ActivityMonitor::DB::PostgreSQL.new(db_conn_uri)
      end


    end
  end
end

