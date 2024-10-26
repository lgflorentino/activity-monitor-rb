module ActivityMonitor  
  module Actions
    module AM
      class Index < Hanami::Action
        def handle(req, res)
          res.body = "Hello from ActivityMonitor! Slice"
        end
      end
    end
  end
end
