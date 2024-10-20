require_relative "shared_route_context"

RSpec.describe "DefaultRouter Codeberg Routes" do
  include_context "shared route context"

  context "codeberg" do
  # https://forgejo.org/docs/latest/user/webhooks/
    it "responds to '/am/cb/new' route" do
      res = Rack::MockRequest.new(router).post('/am/cb/new', :input => StringIO.new({ test: "data"}.to_json))
      expect(res.status).to equal(200)
    end
  end

end
