# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_form_localized_input/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_form_localized_input'
  spec.version       = SimpleFormLocalizedInput::VERSION
  spec.authors       = ['Tomas Celizna']
  spec.email         = ['tomas.celizna@gmail.com']
  spec.summary       = 'Custom input for Simple Form that renders Mongoid fields for multiple locales.'
  spec.description   = 'Custom input for Simple Form that renders Mongoid fields for multiple locales.'
  spec.homepage      = 'https://github.com/tomasc/simple_form_localized_input'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'simple_form', '>= 3.0.2'
  spec.add_dependency 'mongoid', '>= 4.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
end
