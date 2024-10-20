require_relative "shared_route_context"

RSpec.describe "DefaultRouter Github Routes" do

  include_context "shared route context"

  context "github" do
  # https://docs.github.com/en/webhooks/using-webhooks/handling-webhook-deliveries
    it "responds to '/am/gh/new' route" do
      res = Rack::MockRequest.new(router).post('/am/gh/new', :input => StringIO.new({ test: "data"}.to_json))
      expect(res.status).to equal(200)
    end
  end

end
