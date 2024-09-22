# frozen_string_literal: true

require "activity_monitor"

RSpec.describe ActivityMonitor do
  it "has a version number" do
    expect(ActivityMonitor::VERSION).to eq("0.1.0")
  end

  it "can be setup" do
    expect(ActivityMonitor.setup).to be_a_kind_of(ActivityMonitor::App)
  end
end
