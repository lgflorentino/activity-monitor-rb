# frozen_string_literal: true

require "hanami/routes"

module ActivityMonitor
  class Routes < Hanami::Routes
    get "/hello", to: "am.index"
  end
end
