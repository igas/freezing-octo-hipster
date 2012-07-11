# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spbdb/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Igor Kapkov"]
  gem.email         = ["igasgeek@me.com"]
  gem.description   = %q{Sample binarydb}
  gem.summary       = %q{Sample binarydb}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "spbdb"
  gem.require_paths = ["lib"]
  gem.version       = Spbdb::VERSION
end
