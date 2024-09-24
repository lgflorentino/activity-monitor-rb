# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("cli" => "CLI")
loader.inflector.inflect("db" => "DB")
loader.inflector.inflect("sqlite" => "SQLite")
loader.inflector.inflect("postgresql" => "PostgreSQL")
loader.inflector.inflect("am_events" => "AMEvents")
loader.inflector.inflect("am_repo" => "AMRepo")
loader.setup

module ActivityMonitor
  def self.setup
    unless instance_variable_defined?(:@am)
      @am = ActivityMonitor::App.new
    end

    @am.log.debug "Setup finished"
    @am
  end

  def self.run
    setup
  end
end
