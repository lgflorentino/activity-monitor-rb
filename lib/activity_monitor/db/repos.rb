# frozen_string_literal: true

module ActivityMonitor
  module DB
    module Repos
      def self.init_repo(service_name: nil, db: nil)
        if db.nil?; raise Errors::ActivityMonitorError("No db object passed to #{self}"); end

        case service_name
        when "bitbucket"
          DB::Repos::BBRepo.new(db)
        when "codeberg"
          DB::Repos::CBRepo.new(db)
        when "github"
          DB::Repos::GHRepo.new(db)
        when "gitlab"
          DB::Repos::GLRepo.new(db)
        else
          raise Errors::RepoError.new(" Initialising repo for '#{service_name}' not found.")
        end
      end
    end
  end
end
