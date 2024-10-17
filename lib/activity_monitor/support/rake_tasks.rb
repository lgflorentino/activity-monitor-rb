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
    cfg = ActivityMonitor::Config.new
    db_cfgs = cfg.config[:db_connections]
    rom_cfgs = {} 
    db_cfgs.each do |conn|
      rom_cfgs[conn[:name].to_sym] = [
        :sql,
        conn[:connection_string],
        { options: conn.has_key?(:options) ? conn[:options] : nil}
        ]
    end
    rom = ROM.container(rom_cfgs)
    ROM::SQL::RakeSupport.env = rom
  end

  desc "Seeds the database for testing purposes"
  task :seed => :setup do
    require_relative "db_seeder_test.rb"
  end
  
end

