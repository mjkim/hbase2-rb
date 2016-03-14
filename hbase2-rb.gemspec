# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "hbase2-rb"
  s.version     = "1.2.0.1"
  s.authors     = ["Myungjun Kim"]
  s.email       = ["niduss@gmail.com"]
  s.homepage    = "http://github.com/mjkim/hbase2-rb"
  s.summary     = %q{Generated HBase Thrift bindings for Ruby packed into a gem}
  s.description = %q{Everything you need to build a Ruby client for HBase}
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "thrift", "~> 0.9.3"

  s.add_development_dependency "rake", "~> 10.0"
end
