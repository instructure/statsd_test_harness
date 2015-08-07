require 'dotenv'
Dotenv.load

StatsdTestHarness.configure do |config|
  config.statsd_host      = ENV['STATSD_HOST']
  config.statsd_port      = ENV['STATSD_PORT']
  config.statsd_app_name  = ENV['STATSD_APP_NAME']
  config.statsd_namespace = ENV['STATSD_NAMESPACE']

  config.tools = [
    {
      name: 'rspec',
      command: 'rspec',
      label: 'rspec',
      options: '',
      ignore_return_value: true,
      postprocessor: StatsdTestHarness::Postprocessors::RSpec
    }
  ]

end
