# frozen_string_literal: true

require "rom-repository"

module ActivityMonitor
  module DB
    module Repos
    
      # Service repo for the Github service.
      class GHRepo < ROM::Repository[:gh_events]
      
      end
    end
  end
end
