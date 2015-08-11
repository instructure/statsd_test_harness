require 'dotenv'
Dotenv.load

StatsdTess.configure do |config|
  config.host      = ENV['STATSD_HOST']
  config.port      = ENV['STATSD_PORT']
  config.app_name  = ENV['STATSD_APP_NAME']
  config.namespace = ENV['STATSD_NAMESPACE']

  config.tools = [
    {
      name: 'rspec',
      command: 'rspec',
      options: '',
      ignore_return_value: true
    }
  ]

end
