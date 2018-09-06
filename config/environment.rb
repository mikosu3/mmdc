# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

class Logger
  class Formatter
    def call(severity, time, progname, msg)
      if msg.class.to_s == "String"
        if msg.present? && !msg.include?("assets") && !msg.include?("erb")
          format = "[%s #%d] %5s -- %s: %s\n"
          format % ["#{time.strftime('%Y-%m-%d %H:%M:%S')}.#{'%06d' % time.usec.to_s}",$$, severity, progname, (String === msg) ? msg : msg.inspect]
        end
      end
    end
  end
end
