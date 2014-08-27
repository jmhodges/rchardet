require './lib/rchardet/version'

Gem::Specification.new "rchardet", CharDet::VERSION do |s|
  s.author     = ["Michael Grosser", "Jeff Hodges"]
  s.email      = ["michael@grosser.it", "jeff@somethingsimilar.com"]
  s.homepage   = "https://github.com/jmhodges/rchardet"
  s.summary    = "Character encoding auto-detection in Ruby. As smart as your browser. Open source."
  s.files      = Dir["lib/**/*"]
  s.license    = "LGPL"
end
