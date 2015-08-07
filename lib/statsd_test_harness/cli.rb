require "thor"
require "statsd_test_harness"

module StatsdTestHarness

  class CLI < Thor

    desc "wrap run_suite --config PATH_TO_CONFIG", ""
    method_option :config, type: :string, default: '', aliases: "-c"

    def run_suite
      StatsdTestHarness.new(options['config']).run
    end

  end

end