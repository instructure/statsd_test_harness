module StatsdTestHarness

  class Processor

    require 'canvas_statsd'

    attr_reader :path_to_config

    def initialize(path_to_config)
      @path_to_config = path_to_config
    end

    def run
      load_external_config
      StatsdTestHarness.config.tools.each do |tool_harness|
        tool = Tool.new(tool_harness)
        puts "Executing #{tool.label} test suite..."
        if data = tool.run
          post_to_statsd(data, tool.label)
        end
        puts "Test suite run complete."
      end
    end

    private

    def load_external_config
      begin
        load self.path_to_config
        validate_path_to_config
        validate_env_variables
      rescue Exception => e
        puts "-- Unable to read config file: #{e}"
      end
    end

    def post_to_statsd(data, label)
      puts "Sending test data from #{label} suite for app #{StatsdTestHarness.config.statsd_app_name}..."
      setup_canvas_statsd
      CanvasStatsd::Statsd.timing(
        "#{label}.duration",
        data.duration
      )
    end

    def setup_canvas_statsd
      CanvasStatsd.settings = {
        host: StatsdTestHarness.config.statsd_host,
        port: StatsdTestHarness.config.statsd_port,
        namespace: "#{StatsdTestHarness.config.statsd_namespace}.#{StatsdTestHarness.config.statsd_app_name}",
        append_hostname: false
      }
    end

    def validate_path_to_config
      if self.path_to_config.empty?
        puts "No config file specified, exiting"
        exit
      end
    end

    def validate_env_variables
      unless StatsdTestHarness.config.statsd_host && StatsdTestHarness.config.statsd_port
        puts "No statsd environment variables defined, exiting"
        exit
      end
    end
  end

end