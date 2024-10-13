# frozen_string_literal: true

require "rom-repository"

module ActivityMonitor
  module DB
    module Repos
    
      # Service repo for the Bitbucket service.
      class BBRepo < ROM::Repository[:bb_events]

        commands :create
        
        def by_id(id)
          bb_events.by_pk(id).one!
        end
       
      end
    end
  end
end
