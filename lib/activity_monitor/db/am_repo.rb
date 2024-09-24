# frozen_string_literal: true

require "rom-repository"

module ActivityMonitor
  module DB
    class AMRepo < ROM::Repository[:am_events]
      
      commands :create, update: :by_pk, delete: :by_pk

    end
  end
end
