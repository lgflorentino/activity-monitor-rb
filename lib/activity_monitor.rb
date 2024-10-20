# frozen_string_literal: true

require "zeitwerk"

module ActivityMonitor

  def self.loader 
    require_relative "activity_monitor/support/gem_inflector"
    @loader ||= Zeitwerk::Loader.for_gem.tap do |l|
      l.inflector = ActivityMonitor::Support::GemInflector.new(__FILE__)
    end
  end

  def self.app
    unless instance_variable_defined?(:@am)
      @am ||= ActivityMonitor::App.new
    end

    @am      
  end

  loader.setup
end

