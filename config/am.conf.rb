# frozen_string_literal: true

module ActivityMonitor
  class Config
    AM_CONF = {
      root_slug: "/api/am",
      enabled_services: %i[
        github
        gitlab
        bitbucket
        sourcehut
        codeberg
      ]
    }.freeze
  end
end
