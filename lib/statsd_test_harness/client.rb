module StatsdTestHarness
  class Client

    def post(duration, label, successful, send_failures=true)
      type = successful ? "success" : "fail"
      if successful || send_failures
        puts "Sending '#{type}' test data from #{label} suite for app #{StatsdTestHarness.config.app_name}..."
        client.timing("#{bucket}.#{label}.#{type}", duration)
      end
    end

    private

    def bucket
      "#{StatsdTestHarness.config.namespace}.#{StatsdTestHarness.config.app_name}"
    end

    def client
      Statsd.new(StatsdTestHarness.config.host, StatsdTestHarness.config.port)
    end

  end
end
