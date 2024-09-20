# frozen_string_literal: true

=begin 
This class 
=end

require "hanami/cli"

module ActivityMonitor
  module Templates
    module Hanami
        class ProviderGenerator

          def initialize()

            @file_path = "/config/providers/activity_monitor.rb"
            
          end
        
        BASE_PROVIDER = <<-PROVIDER_TEMPLATE
Hanami.app.register_provider(:activity_monitor, namespace: true) do |container|
  
  #ActivityMonitor initialisation procedure goes here
  prepare do
    require 'activity_monitor'
    ActivityMonitor::setup
  end

  # ActivityMonitor runtime procedure goes here
  start do
    app = ActivityMonitor::App::new
    register 'app', app
  end

  #ActivityMonitor exit procedure goes here
  stop do 
  end
end      
        PROVIDER_TEMPLATE
        
        attr_accessor :file_path

        end
    end
  end
end
