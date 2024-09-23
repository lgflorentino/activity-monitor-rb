# frozen_string_literal: true

module ActivityMonitor
  module Router

    def select_router
      ActivityMonitor::Routing::DefaultRouter.new
    end

    module_function :select_router
  end
end
