# frozen_string_literal: true

require "zeitwerk"

module ActivityMonitor
  module Support
    class GemInflector < Zeitwerk::GemInflector

      def camelize(basename, abspath)
        case basename
        # \A matches start of string
        # =~ matches against a regex
        # (.*) dot matches any character, star matches preceding character 0 or more times
        when /\Aam(.*)/
          "AM" + super($1, abspath)
        when /\Acli(.*)/
          "CLI" + super($1, abspath)
        when /\Adb(.*)/
          "DB" + super($1, abspath)
        when /\Abb_(.*)/
          "BB" + super($1, abspath)
        when /\Acb_(.*)/
          "CB" + super($1, abspath)
        when /\Agh_(.*)/
          "GH" + super($1, abspath)
        when /\Agl_(.*)/
          "GL" + super($1, abspath)
        when /\Ash_(.*)/
          "SH" + super($1, abspath)
        when /\Asqlite(.*)/
          "SQLite" + super($1, abspath)
        when /\Apgsql(.*)/
          "PGSQL" + super($1, abspath)
        else
          super
        end
      end
    end
  end
end
