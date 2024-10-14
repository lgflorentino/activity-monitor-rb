# frozen_string_literal: true

require "rom-repository"

module ActivityMonitor
  module DB
    module Repos
      # Service repo for the Gitlab service.
      class GLRepo < ROM::Repository[:gl_events]
        commands :create     
      end
    end
  end
end
