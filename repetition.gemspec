# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'repetition/version'

Gem::Specification.new do |spec|
  spec.name          = "repetition"
  spec.version       = Repetition::VERSION
  spec.authors       = ["Dan Kim", "Scott Harvey"]
  spec.email         = []

  spec.summary       = %q{Spaced repetition algorithm module that can be used as a mixin in Ruby apps}
  spec.description   = %q{Spaced repetition algorithm module that can be used as a mixin in Ruby apps}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
