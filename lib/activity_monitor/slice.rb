# frozen_string_literal: true

require "hanami"
require "dry/inflector"

module ActivityMonitor
  class Slice < Hanami::Slice
    include Logging

    config.root = Pathname(__dir__).join("../../slice/activity_monitor").realpath
    config.inflections do |inflections|
      inflections.acronym "AM"
    end

    def initialize
      log.debug "Loaded #{__FILE__}"
    end

  end
end
