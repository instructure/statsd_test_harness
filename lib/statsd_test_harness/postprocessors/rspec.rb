module StatsdTestHarness
  module Postprocessors
    class RSpec

      attr_reader :output

      def initialize(output)
        @output = output
      end

      def duration
        duration_string = /^real(.+)/.match(self.output).to_a.last
        hours   = /([0-9\.]+)h/.match(duration_string).to_a.last.to_f || 0
        minutes = /([0-9\.]+)m/.match(duration_string).to_a.last.to_f || 0
        seconds = /([0-9\.]+)s/.match(duration_string).to_a.last.to_f || 0
        ((hours * 60 * 60) + (minutes * 60) + seconds) * 1000
      end

    end
  end
end