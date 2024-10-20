# frozen_string_literal: true

source "https://rubygems.org"

gem "dotenv", "= 3.1.4", groups: [:development, :test]

# Specify your gem's dependencies in activity_monitor.gemspec
gemspec

group :db_sqlite_backend do
  gem "sqlite3", "~> 2.0"
end

group :db_pgsql_backend do
  gem "pg", "~> 1.5"
  gem "sequel_pg", "~> 1.17"
end


