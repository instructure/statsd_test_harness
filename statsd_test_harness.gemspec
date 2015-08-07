# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statsd_test_harness/version'

Gem::Specification.new do |spec|
  spec.name          = "statsd_test_harness"
  spec.version       = StatsdTestHarness::VERSION
  spec.authors       = ["CoralineAda"]
  spec.email         = ["coraline@idolhands.com"]

  spec.summary       = %q{Test harness for reporting to statsd.}
  spec.description   = %q{Captures output of various testing frameworks to post to statsd.}
  spec.homepage      = "https://github.com/CoralineAda/statsd_test_harness"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "require_all", "~> 1.3"
  spec.add_dependency "canvas_statsd", "~> 1.0"
  spec.add_dependency "dotenv", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
