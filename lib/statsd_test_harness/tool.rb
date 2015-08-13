module StatsdTestHarness
  class Tool

    attr_reader :name, :command, :options, :label, :ignore_return_value

    def initialize(attrs={})
      @name     = attrs[:name]
      @command  = attrs[:command]
      @options  = attrs[:options]
      @label    = attrs[:label]
      @ignore_return_value = attrs[:ignore_return_value]
    end

    def run
      cmd = open("| #{self.command} #{self.options}")
      cmd.each_line{ |io| print io }
      cmd.close

      if $?.to_i > 0 && ! ignore_return_value
        raise "Test run returned non-zero status, results not submitted."
      end
      true
    end

  end
end