require_relative "shared_route_context"

RSpec.describe "DefaultRouter Gitlab Routes" do

  include_context "shared route context"

  context "gitlab" do
  # https://docs.github.com/en/webhooks/using-webhooks/handling-webhook-deliveries
    it "responds to '/am/gl/new' route" do
      res = Rack::MockRequest.new(router).post('/am/gl/new', :input => StringIO.new({ test: "data"}.to_json))
      expect(res.status).to equal(200)
    end
  end

end
