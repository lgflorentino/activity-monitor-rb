# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"
require "rom/sql/rake_task"
require "rom"
require "activity_monitor"

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new

task default: %i[rubocop spec]

task :docker_tests do
  ruby "spec/docker/run_docker_tests.rb"
end


namespace :db do
  

  desc "Sets up the database for use with AM"
  task :setup do
    app_cfg = ActivityMonitor::Config.instance
    rom_cfg = ROM::Configuration.new(:sql, app_cfg.config[:db_url])
    rom = ROM.container(rom_cfg)
    ROM::SQL::RakeSupport.env = rom
  end

  desc "Seeds the database for testing purposes"
  task :seed => :setup do
    require_relative "db_seeder_test.rb"
  end
  
end

