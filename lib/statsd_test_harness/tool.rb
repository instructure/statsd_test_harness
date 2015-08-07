module StatsdTestHarness

  class Tool

    attr_reader :name, :label, :command, :options, :ignore_return_value, :postprocessor

    def initialize(attrs={})
      @name = attrs[:name]
      @command = attrs[:command]
      @options = attrs[:options]
      @label = attrs[:label]
      @postprocessor = attrs[:postprocessor]
      @ignore_return_value = attrs[:ignore_return_value]
    end

    def run
      output = `#{self.command} #{self.options}`
      puts output
      data = self.postprocessor.new(output)
      if $?.to_i > 0 && ! ignore_return_value
        raise "Test run returned non-zero status, results not submitted."
      end
      data
    end

  end

end