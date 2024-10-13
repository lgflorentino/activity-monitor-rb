
require_relative "shared_route_context"

require "json"

RSpec.describe "DefaultRouter Bitbucket Routes" do
  include_context "shared route context"

  context "bitbucket" do
  # https://support.atlassian.com/bitbucket-cloud/docs/manage-webhooks/
    it "responds to '/am/bb/new' route" do
      response = router.process_request(:bitbucket, {
        "PATH_INFO" => @test_routes[:bitbucket][:new], 
        "rack.input" => {
          "test" => "data"
        }
      })
      expect(response[0]).to equal(200)
    end
  end
end
