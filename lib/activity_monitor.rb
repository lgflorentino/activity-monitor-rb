# frozen_string_literal: true

require "hanami" if Gem.loaded_specs.key? "hanami"
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("cli" => "CLI")
loader.setup

module ActivityMonitor
  def self.setup
    unless instance_variable_defined?(:@am)
      @am = ActivityMonitor::App.new
    end

    if (defined? Hanami) && Hanami.app?
      @am.set_config "is_hanami_app=", true
    end

    @am.log.debug "Setup finished"
    @am
  end

  def self.run
    setup
  end
end
