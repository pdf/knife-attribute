# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife-attribute/version'

Gem::Specification.new do |spec|
  spec.name          = 'knife-attribute'
  spec.version       = KnifeAttribute::VERSION
  spec.authors       = ['Peter Fern']
  spec.email         = ['ruby@0xc0dedbad.com']
  spec.description   = %q{Manipulate Chef attributes (currently only for nodes) via Knife}
  spec.summary       = %q{Manipulate Chef attributes via Knife}
  spec.homepage      = 'https://github.com/pdf/knife-attribute'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'chef', '>= 0.11'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
