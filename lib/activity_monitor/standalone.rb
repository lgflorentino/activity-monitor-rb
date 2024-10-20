# frozen_string_literal: true

require "bundler/setup"

# For production the environment variables should be created externally
# The app will pull sensitive settings from the environment expecting that they already exist.
# For development we will override them in the following 'dotenv' files. 
# More info: https://github.com/bkeepers/dotenv/blob/main/README.md#customizing-rails
if ENV&.fetch("AM_ENV") == "development" or ENV&.fetch("AM_ENV") == "dev"
  Bundler.require(:development)
  Dotenv.load(".env.local")
  Dotenv.load(".env.development")
  Dotenv.load(".env")
end

require "activity_monitor"

include ActivityMonitor::Logging
log.debug("Starting ActivityMonitor in standalone mode !")

