module StatsdTestHarness
  class Client

    def post(duration, label)
      puts "Sending test data from #{label} suite for app #{StatsdTestHarness.config.app_name}..."
      client.timing(
        "#{StatsdTestHarness.config.namespace}.#{StatsdTestHarness.config.app_name}.#{label}.duration",
        duration
      )
    end

    private

    def client
      Statsd.new(StatsdTestHarness.config.host, StatsdTestHarness.config.port)
    end

  end
end