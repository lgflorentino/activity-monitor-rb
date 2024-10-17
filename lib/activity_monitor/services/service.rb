# frozen_string_literal: true

module ActivityMonitor
  module Services
    class Service
      include ActivityMonitor::Logging

      def initialize()
        @service_name = "default"
        # @repo: reference to the configured ROM::Repository object for this service
        @db_repo = nil
        @data = {}
      end


      def db_setup(db: nil)
        @db_repo = DB::Repos.init_repo(service_name: @service_name, db: db)
      end

      def call(env, res);               puts "override this method"; end
      def verified_sender?(env, res);   puts "override this method"; end
      def check_req_headers(env, res);  puts "override this method"; end
      def process_req_data(env, res);   puts "override this method"; end

      attr_accessor :data

    end
  end
end
