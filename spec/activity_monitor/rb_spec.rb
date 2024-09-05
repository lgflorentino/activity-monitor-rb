# frozen_string_literal: true

require "activity_monitor"

RSpec.describe ActivityMonitor do
  it "has a version number" do
    expect(ActivityMonitor::VERSION).not_to be nil
  end

  it "returns an instance of the module" do
    am = ActivityMonitor.initialize
    expect(am).to eq(0)
  end
end
