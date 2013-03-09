# -*- encoding: utf-8 -*-

Version = "0.1"

Gem::Specification.new do |spec|
  spec.name = 'motion-smarticons'
  spec.summary = 'Automatically generate icon labels for RubyMotion apps'
  spec.description = "motion-smarticons lets you overlay informational text like commit hash and version number on top of RubyMotion app icons" 
  spec.author = 'Clay Allsopp'
  spec.email = 'clay.allsopp@gmail.com'
  spec.homepage    = "https://github.com/clayallsopp/motion-smarticons"
  spec.version = Version

  spec.add_dependency "rmagick", "~> 2.13"

  files = []
  files << 'README.md'
  files << 'LICENSE'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files = files
end
