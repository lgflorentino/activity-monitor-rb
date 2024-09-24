# frozen_string_literal: true

require "bundler"
Bundler.require(:db_pgsql_backend)

module ActivityMonitor
  module DB
    class PostgreSQL

      def initialize(db_conn_uri)
        p "inside #{self.to_s}"
      end
    end
  end
end
