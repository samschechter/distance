# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'distance/version'

Gem::Specification.new do |spec|
  spec.name          = 'distance'
  spec.version       = Distance::VERSION
  spec.authors       = ['Tom Collier']
  spec.email         = ['tcollier@gmail.com']

  spec.summary       = %q{Convenience methods for ruby.}
  spec.homepage      = 'https://github.com/tcollier/distance'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
