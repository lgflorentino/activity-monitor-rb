# frozen_string_literal: true

require "rom-repository"

module ActivityMonitor
  module DB
    module Repos   
      # Service repo for the Source Hut service.
      class SHRepo < ROM::Repository[:sh_events]
      end
    end
  end
end
