# frozen_string_literal: true

RSpec.describe ActivityMonitor::App do
  
  context "instantiation" do
    subject(:app) do
      ActivityMonitor::App.new
    end

    it "can be instantiated" do
      expect(app).to be_a_kind_of(ActivityMonitor::App)
    end
  end

end
