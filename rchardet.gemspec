require './lib/rchardet/version'

Gem::Specification.new "rchardet", CharDet::VERSION do |s|
  s.author     = ["Michael Grosser", "Jeff Hodges"]
  s.email      = ["michael@grosser.it", "jeff@somethingsimilar.com"]
  s.homepage   = "https://github.com/jmhodges/rchardet"
  s.summary    = "Character encoding auto-detection in Ruby. As smart as your browser. Open source."
  s.files      = Dir["lib/**/*", "LGPL-LICENSE.txt"]
  s.license    = "LGPL"
  s.required_ruby_version = ">= 3.0.0"
end
