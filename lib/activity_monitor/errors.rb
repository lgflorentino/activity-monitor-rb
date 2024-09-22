# frozen_string_literal: true

module ActivityMonitor
  module Errors
    class ActivityMonitorError < StandardError
      def initialize
        super("ActivityMonitor encountered an unknown error!")
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
  end
end
