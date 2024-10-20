
require_relative "shared_route_context"

require "json"

RSpec.describe "DefaultRouter Bitbucket Routes" do
  include_context "shared route context"

  context "bitbucket" do
  # https://support.atlassian.com/bitbucket-cloud/docs/manage-webhooks/
    it "responds to '/am/bb/new' route" do
      res = Rack::MockRequest.new(router).post('/am/bb/new', :input => StringIO.new({ test: "data"}.to_json))
      expect(res.status).to equal(200)
    end
  end
end
