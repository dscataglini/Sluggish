# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sluggable/version"

Gem::Specification.new do |s|
  s.name        = "sluggable"
  s.version     = Sluggable::VERSION
  s.authors     = ["Diego Scataglini"]
  s.email       = ["diego@junivi.com"]
  s.homepage    = ""
  s.summary     = %q{Writes a quick [] finder}
  s.description = %q{aliases [] to find_by_(name|slug|key) or your own preference}

  s.rubyforge_project = "sluggable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency('shoulda')
  s.add_development_dependency('mocha')
end
