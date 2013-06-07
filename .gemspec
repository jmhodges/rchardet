require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'

require './lib/rchardet.rb'

Gem::Specification.new do |s|
  s.name       = "rchardet"
  s.version    = CharDet::VERSION
  s.author     = "Jeff Hodges"
  s.email      = "jeff@somethingsimilar.com"
  s.homepage   = "http://github.com/jmhodges/rchardet"
  s.platform   = Gem::Platform::RUBY
  s.summary    = "Character encoding auto-detection in Ruby. As smart as your browser. Open source."
  s.files      = FileList["lib/**/*"]
  s.require_path      = "lib"
  s.has_rdoc          = false # TODO: fix
  s.extra_rdoc_files  = ['README', 'COPYING']
  s.rubyforge_project = "rchardet"
  s.license = "LGPL"
end
