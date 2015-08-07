require "require_all"
require_rel "statsd_test_harness"

module StatsdTestHarness

  def self.new(path_to_config)
    StatsdTestHarness::Processor.new(path_to_config)
  end

  class << self
    attr_accessor :config
  end

  def self.configure(&block)
    @config = Configuration.new
    yield(config)
  end

  def self.config
    @config || Configuration.new
  end

  class Configuration
    attr_accessor :tools, :statsd_host, :statsd_port, :statsd_app_name, :statsd_namespace
  end

end
