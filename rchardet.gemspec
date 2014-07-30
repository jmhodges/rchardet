require './lib/rchardet'

Gem::Specification.new "rchardet", CharDet::VERSION do |s|
  s.author     = "Jeff Hodges"
  s.email      = "jeff@somethingsimilar.com"
  s.homepage   = "http://github.com/jmhodges/rchardet"
  s.platform   = Gem::Platform::RUBY
  s.summary    = "Character encoding auto-detection in Ruby. As smart as your browser. Open source."
  s.files      = Dir["lib/**/*"]
  s.has_rdoc          = false # TODO: fix
  s.extra_rdoc_files  = ['README', 'COPYING']
  s.rubyforge_project = "rchardet"
  s.license = "LGPL"
end
