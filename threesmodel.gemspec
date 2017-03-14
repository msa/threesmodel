# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'threesmodel/version'

Gem::Specification.new do |spec|
  spec.name          = "threesmodel"
  spec.version       = Threesmodel::VERSION
  spec.authors       = ["Måns Sandström"]
  spec.email         = ["mans.sandstrom@gmail.com"]
  spec.description   = %q{A stab at implementing the game logic for the game threes, eventually making it scriptable for a bot.}
  spec.summary       = %q{An API for something that resembles the game threes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14.6"
  spec.add_development_dependency "rake"
end
