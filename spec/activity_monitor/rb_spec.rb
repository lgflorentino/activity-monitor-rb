# frozen_string_literal: true

require "activity_monitor"

RSpec.describe ActivityMonitor do
  it "has a version number" do
    expect(ActivityMonitor::VERSION).to eq("0.1.0")
  end

  it "returns an instance" do
    am = ActivityMonitor::ActivityMonitor.env()
    expect(am).to eq("3.1")
  end
end
