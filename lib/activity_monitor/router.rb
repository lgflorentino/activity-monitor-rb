# frozen_string_literal: true

module ActivityMonitor
  module Router
    require_relative "router/default"

    def select_router
      ActivityMonitor::Router::Default.new
    end

    module_function :select_router
  end
end
