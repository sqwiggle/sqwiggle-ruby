# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sqwiggle/version'

Gem::Specification.new do |spec|
  spec.name          = "sqwiggle-ruby"
  spec.version       = Sqwiggle::VERSION
  spec.authors       = ["Luke Roberts"]
  spec.email         = ["luke@sqwiggle.com"]
  spec.description   = %q{Ruby wrapper for the sqwiggle API}
  spec.summary       = %q{Ruby wrapper for the sqwiggle API}
  spec.homepage      = "http://github.com/sqwiggle/sqwiggle-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'virtus'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
