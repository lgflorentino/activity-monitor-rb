require_relative "shared_route_context"

RSpec.describe "DefaultRouter Gitlab Routes" do

  include_context "shared route context"

  context "gitlab" do
  # https://docs.github.com/en/webhooks/using-webhooks/handling-webhook-deliveries
    it "responds to '/am/gl/new' route" do
      response = router.process_request({"PATH_INFO" => @test_routes[:gitlab][:new]})
      expect(response[0]).to equal(200)
    end
  end

end
