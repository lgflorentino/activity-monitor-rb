require_relative "shared_route_context"

RSpec.describe "DefaultRouter Codeberg Routes" do
  include_context "shared route context"

  context "codeberg" do
  # https://forgejo.org/docs/latest/user/webhooks/
    it "responds to '/am/cb/new' route" do
      response = router.process_request({"PATH_INFO" => @test_routes[:codeberg][:new]})
      expect(response[0]).to equal(200)
    end
  end

end
