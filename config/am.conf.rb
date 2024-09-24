# frozen_string_literal: true

module ActivityMonitor
  class Config
    AM_CONF = { # endpoint composition `/:am_slugs/:service_slug/:trailing_slugs`
      root_slugs: %w[ 
        am
      ], 
      enabled_services: {
        bitbucket: {
          slug: "bb"
        },
        codeberg: {
          slug: "cb"
        },
        github: {
          slug: "gh"
        },
        gitlab: {
          slug: "gl"
        },
        sourcehut: {
          slug: "sh"
        }
      },
      trailing_slugs: %w[
        new
      ],
      db_url: unless ENV.key?("DATABASE_URL") then
                "sqlite://#{__dir__}/../.data/am.db" else
                ENV["DATABASE_URL"] end
    }.freeze
  end
end
