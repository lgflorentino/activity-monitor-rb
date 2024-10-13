# frozen_string_literal: true

require "activity_monitor/support/gem_inflector"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem.tap do |l|
  l.inflector = ActivityMonitor::Support::GemInflector.new(__FILE__)
end
loader.setup

module ActivityMonitor

  def self.setup(*args)

    unless instance_variable_defined?(:@am)
      @am ||= ActivityMonitor::App.new
    end

    @am
  end

  def self.run
    setup
  end

  def self.am
    unless instance_variable_defined?(:@am)
      setup
    end

    @am
  end

end
