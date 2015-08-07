# StatsdTestHarness

A test harness that captures output of various testing frameworks to post to statsd.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'statsd_test_harness'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install statsd_test_harness

## Configuration

Set the following environment variables for statsd integration:

    export STATSD_HOST=192.168.42.10
    export STATSD_PORT=8125
    export STATSD_NAMESPACE=statsd_test_harness
    export STATSD_APP_NAME=my_app_name

## Usage

To start a graphite/statsd docker file:

    docker run -d --name graphite --restart=always -p 80:80 -p 2003:2003 -p 8125:8125/udp hopsoft/graphite-statsd -e VIRTUAL_HOST=graphite.docker

You must specify a config file at runtime:

    wrap run_suite --config path/to/config/file.rb

For an example of what the config file should look like, refer to config/sample_config.rb

## Jasmine Configuration

Start by installing jasmine-terminal-reporter:

    npm install jasmine-terminal-reporter

Then add to your jasmine spec runner:

    var Reporter = require('jasmine-terminal-reporter');
    var reporter = new Reporter(options)

## Development

To add support for a new test suite, create a file in statsd_test_harness/postprocessors/ that will extract the duration output
from the testing framework. Follow statsd_test_harness/postprocessors/rspec.rb for an example.

To register the postprocessor, add it to the `config.tools` array in your config file, e.g.

    {
      name: 'my_framework',
      command: 'test',
      label: 'my_framework',
      options: '',
      ignore_return_value: true,
      postprocessor: StatsdTestHarness::Postprocessors::MyPostProcessor
    }

Set the `ignore_return_value` flag to false if you don't want to report an unsuccessful test run (based on exit status).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/statsd_test_harness/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
