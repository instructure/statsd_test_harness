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
      exit_status
    end

    def exit_status
      $?.exitstatus
    end

  end
end
