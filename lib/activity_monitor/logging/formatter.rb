#frozen_string_literal: true

require "logger"
require "rainbow"

module ActivityMonitor
  module Logging
    class Formatter < Logger::Formatter

      def call(severity, time,  progname, msg)
        case severity 
        when "DEBUG"
          bg = :darkslategray
          fg = :black
        when "INFO"
          bg = :darkslategray
          fg = :skyblue
        when "WARN"
          bg = :darkslategray
          fg = :orange
        when "ERROR"
          bg = :black
          fg = :red
        when "FATAL"
          bg = :black
          fg = :crimson
        when "ANY"
          bg = :black
          fg = :white
        else
          bg = :black
          fg = :white
        end


        Format % [ Rainbow(severity[0..0]).fg(fg).bg(bg), \
                   format_datetime(time), \
                   $$, \
                   Rainbow(severity).fg(fg).bg(bg), \
                   progname, \
                   msg2str(msg) 
        ]

      end
    end
  end
end
