# frozen_string_literal: true

module ActivityMonitor
  module Errors
    class ActivityMonitorError < StandardError
      def initialize(arg)
        super("ActivityMonitor: " + arg)
      end
    end

    class FileDoesNotExistError < ActivityMonitorError
      def initialize(arg: nil)
        super("The file '#{arg}' does not exist !")
      end
    end

    class FileExistsError < ActivityMonitorError
      def initialize(arg: nil)
        super("The file '#{arg}' already exists!")
      end
    end

    class ConfigurationSettingError < ActivityMonitorError
      def initialize(cfg_name:, cfg_val:)
        super("The configuration setting: #{cfg_name}, does not accept value: #{cfg_val}.")
      end
    end
    
    class DBConnectionError < ActivityMonitorError
      def initialize(arg)
        if arg
          super("#{arg}")
        else
          super("The connection string was malformed: #{args}")
        end
      end
    end
    
    class TypeError < ActivityMonitorError
      def initialize(arg)
        super(arg)
      end
    end

    class ArgumentLengthError < ActivityMonitorError
      def initialize(arg)
        super(arg)
      end
    end
    
    class ServiceError < ActivityMonitorError
      def initialize(arg)
        super("The problem with the Service was: #{arg}")
      end
    end
    
    class RepoError < ActivityMonitorError
      def initialize(arg)
        super("The problem with the Repo was: #{arg}")
      end
    end


  end
end
