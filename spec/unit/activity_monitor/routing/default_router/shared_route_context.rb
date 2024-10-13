
RSpec.shared_context "shared route context", :shared_context => :metadata do

  before {
    @root_slugs = %w[ /am ]
    @services = { bitbucket: { slug: "bb" }, codeberg: { slug: "cb" }, github: { slug: "gh" }, gitlab: { slug: "gl"}}
    @trailing_slugs = %w[ /new ]
    @test_routes = {
      root:   "/am",
      bitbucket: {
        new: "/am/bb/new"
      },
      codeberg: {
        new: "/am/cb/new"
      },
      github: {
        new: "/am/gh/new"
      },
      gitlab: {
        new: "/am/gl/new"
      }
    }

    @dodgy_root_slugs = %w[ /btbam ]
    @dodgy_services = { f18: { slug: "hornet" }, dehavilland: { slug: "DC8" }}
    @dodgy_trailing_slugs = %w[ /rivers-of-nihil ]
    @dodgy_test_routes = {
      root: "/mangroves"
    }
  }

  subject(:router) do 
    am_router = ActivityMonitor::Routing::DefaultRouter.new
    am_router.routes = ActivityMonitor::Routing::Routes.as_array(@root_slugs, @services, @trailing_slugs)
    return am_router
  end

  subject(:dodgy_router) do
    am_router = ActivityMonitor::Routing::DefaultRouter.new
    am_router.routes = ActivityMonitor::Routing::Routes.as_array(@dodgy_root_slugs, @dodgy_services, @dodgy_trailing_slugs)
    return am_router
  end


end
