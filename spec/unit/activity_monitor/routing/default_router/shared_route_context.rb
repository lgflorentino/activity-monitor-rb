
RSpec.shared_context "shared route context", :shared_context => :metadata do

  before {
    @root_slugs = %w[ /am ]
    @enabled_services = { bitbucket: { slug: "bb" }, codeberg: { slug: "cb" }, github: { slug: "gh" }, gitlab: { slug: "gl"}}
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
    
    class TestBitbucket < ActivityMonitor::Services::Bitbucket
      def call(env, res)
        res.status=(200)
      end
    end
    
    class TestCodeberg < ActivityMonitor::Services::Codeberg
      def call(env, res)
        res.status=(200)
      end
    end
    
    class TestGithub < ActivityMonitor::Services::Github
      def call(env, res)
        res.status=(200)
      end
    end
    
    class TestGitlab < ActivityMonitor::Services::Gitlab
      def call(env, res)
        res.status=(200)
      end
    end

  @services = { bitbucket: TestBitbucket.new, codeberg: TestCodeberg.new, github: TestGithub.new, gitlab: TestGitlab.new}
  }
  
  subject(:router) do 
    class TestRouter < ActivityMonitor::Routing::DefaultRouter
      def call(env)
        match_request(env)
      end
    end

    am_router = TestRouter.new(services: @services)
    am_router.routes = ActivityMonitor::Routing::Routes.as_array(@root_slugs, @enabled_services, @trailing_slugs)
    return am_router
  end

  subject(:dodgy_router) do
    am_router = ActivityMonitor::Routing::DefaultRouter.new
    am_router.routes = ActivityMonitor::Routing::Routes.as_array(@dodgy_root_slugs, @dodgy_services, @dodgy_trailing_slugs)
    return am_router
  end

end
