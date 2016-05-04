# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ec2_switcher/version'

Gem::Specification.new do |spec|
  spec.name          = "ec2_switcher"
  spec.version       = Ec2Switcher::VERSION
  spec.authors       = ["Kevin LEIBA"]
  spec.email         = ["kleiba@student.42.fr"]

  spec.summary       = %q{Turns on/off an ec2 instace}
  spec.description   = %q{Use this gem to simply turn on your ec2 instance when it's off and off when it's on}
  spec.homepage      = "http://bubblz.net"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'aws-sdk', '~> 2'
end
