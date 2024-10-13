# frozen_string_literal: true

require "rom-repository"

module ActivityMonitor
  module DB
    module Repos
    
      # Service repo for the Codeberg service.
      class CBRepo < ROM::Repository[:cb_events]
      
      end
    end
  end
end
