# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sqwiggle/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "sqwiggle-ruby"
  spec.version       = Sqwiggle::Ruby::VERSION
  spec.authors       = ["Luke Roberts"]
  spec.email         = ["email@luke-roberts.co.uk"]
  spec.description   = %q{Ruby wrapper for the sqwiggle API}
  spec.summary       = %q{Ruby wrapper for the sqwiggle API}
  spec.homepage      = ""
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
