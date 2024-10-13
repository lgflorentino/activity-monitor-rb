require_relative "./shared_route_context.rb"
require "rack"
require "json"

RSpec.describe ActivityMonitor::Routing::DefaultRouter do
  include_context "shared route context"

  it "responds to root route with 404" do
    req = Rack::Request.new(Rack::MockRequest.env_for("http://activity.monitor:22229/am"))
    response = router.match_request(req.env)
    expect(response[0]).to equal(404)
  end

  it "responds with a 2** code for a matched route" do
    req = Rack::Request.new(Rack::MockRequest.env_for("http://activity.monitor:22229/am/bb/new", :input => { "name " => "test"}.to_json))
    response = router.match_request(req.env)
    expect(response[0]).to be >= 200
    expect(response[0]).to be < 300
  end

end
