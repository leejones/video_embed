# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'video_embed/version'

Gem::Specification.new do |gem|
  gem.name          = "video_embed"
  gem.version       = VideoEmbed::VERSION
  gem.authors       = ["Lee Jones"]
  gem.email         = ["scribblethink@gmail.com"]
  gem.description   = %q{Generate HTML to embed videos based on a URL}
  gem.summary       = %q{Video embed HTML generator}
  gem.homepage      = "http://github.com/leejones/video_embed"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('pry')
  gem.add_development_dependency('haml')
end
