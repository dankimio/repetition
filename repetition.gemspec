lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'repetition/version'

Gem::Specification.new do |spec|
  spec.name          = 'repetition'
  spec.version       = Repetition::VERSION
  spec.authors       = ['Dan Kim']
  spec.email         = ['itsdanya@gmail.com']

  spec.summary       = 'Spaced repetition algorithm'
  spec.description   = 'Spaced repetition algorithm module that can be used as a mixin in Ruby apps'
  spec.homepage      = 'http://github.com/danyakim/repetition'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 11.0'
end
