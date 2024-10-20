require_relative "./shared_route_context.rb"
require "rack"
require "json"

RSpec.describe ActivityMonitor::Routing::DefaultRouter do
  include_context "shared route context"

  it "responds to root route with 404" do
    res = Rack::MockRequest.new(router).get("http://activity.monitor:22229/am")
    expect(res.status).to equal(404)
  end

  it "responds with a 2** code for a matched route" do
    res = Rack::MockRequest.new(router).post("http://activity.monitor:22229/am/bb/new", :input => { "name " => "test"}.to_json)
    expect(res.status).to be >= 200
    expect(res.status).to be < 300
  end

end
