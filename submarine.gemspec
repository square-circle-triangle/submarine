# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "submarine/version"

Gem::Specification.new do |s|
  s.name        = "submarine"
  s.version     = Submarine::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nick Marfleet"]
  s.email       = ["nick@sct.com.au"]
  s.homepage    = "http://www.sct.com.au"
  s.summary     = %q{The simplest templating language ever seen}
  s.description = %q{The simplest templating language ever seen}

  s.rubyforge_project = "submarine"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
