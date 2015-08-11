module StatsdTestHarness
  class Processor

    require 'statsd'

    attr_reader :path_to_config

    def initialize(path_to_config)
      @path_to_config = path_to_config
      load_config
    end

    def run
      StatsdTestHarness.config.tools.each do |tool_harness|
        tool = Tool.new(tool_harness)
        puts "Executing #{tool.label} test suite for #{StatsdTestHarness.config.app_name}..."
        if duration = with_timing{tool.run}
          StatsdTestHarness::Client.new.post(duration, tool.name)
          puts "Test suite for #{tool.label} completed in #{duration} ms."
        end
      end
    end

    private

    def load_config
      begin
        validate_path_to_config
        load self.path_to_config
        validate_env_variables
      rescue Exception => e
        puts "-- Invalid configuration, exiting: #{e}"
        exit
      end
    end

    def validate_env_variables
      unless StatsdTestHarness.config.host && StatsdTestHarness.config.port
        raise "No statsd environment variables defined."
      end
    end

    def validate_path_to_config
      if self.path_to_config.empty?
        raise "No config file specified."
      end
    end

    def with_timing
      start_time = Time.now.to_f
      yield
      (Time.now.to_f - start_time) * 1000
    end

  end
end