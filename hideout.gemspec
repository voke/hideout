# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hideout/version'

Gem::Specification.new do |spec|
  spec.name          = "hideout"
  spec.version       = Hideout::VERSION
  spec.authors       = ["Gustav"]
  spec.email         = ["gustav@invoke.se"]
  spec.summary       = %q{Get offer data by URL.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
