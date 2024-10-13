# frozen_string_literal: true

# Don't run this is not a script
# This file will be executed as a block by the UserConfig class.

# To modify the base config shipped with ActivityMonitor use the cfg function defined on the block
# Standalone mode is intended to run without modification. 
# If AM is running as a middleware, at a minimum provide a database connection, a router 
# and set the parent_app value to the name of the parent framewok. 
#
# Other components that could be provided [ logger ]

ActivityMonitor::Config.merge! do |c|
  c.cfg :db, "sqlite://./.data/am.db"

  # Example - will prepend the values of the array as URI segments
  #           Default: 'am'
  # c.cfg :root_slugs, %w[ user defined values]
  # Result  - http://localhost/user/defined/values/.....
  #
  # Example - will set the secret for the service. Secrets are used to verify 
  #           the webhook data is legitimate.
  #           Default: 'nil'
  # c.cfg :bitbucket_secret, "<token-data>"
  # Result  - The default action is to skip verification. If the secret exists 
  #           then it will use it to verify the delivery
  #
  # Example - will configure Activity Monitor to be embedded in another framework 
  #           Default: nil (standalone rack app which is not recommended)
  # c.cfg :parent_app, "hanami"
  # Result  - Several of the components of ActivityMonitor will instead be provided by 
  #         the parent framework. ActivityMonitor will act as a plugin or middleware instead
  #         e.g. database, router
  # 
  # Example - will append the values of the array as URI segments
  #           Default: 'new'
  # c.cfg :trailing_slugs, %w [ user defined values ]
  # Result  - http://localhost/<root_slugs>/<service-name>/user/defined/values
  # 
  # Example - will replace the service slug 
  #           Default: %w[ bb cb gh gl ]
  # c.cfg :ss, :bitbucket, "bitbucket"
  # Result  - http://localhost/<root_slugs>/bitbucket/<trailing_slugs>
  #
  # Example - will replace the default database connection
  #           Default: sqlite://#{__dir__}/../.data/am.db
  # c.cfg :db, "postgresql://localhost:5432/activity_monitor"
  # Result: activity_monitor will use the provided connection string to connect to a database
  #
  # Example - will replace the default router
  #           Default: ActivityMonitor::Routing::DefaultRouter
  # c.cfg :router, klass::instance
  # Result  - AM will use the router instance to cofnigure the routes that it needs
  #
  # Example - dumps the current config to console
  # c.dump
  # Result  - Config Hash object as a 
  

end
