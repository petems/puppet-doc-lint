# -*- encoding: utf-8 -*-
require File.expand_path('../lib/puppet-doc-lint/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Peter Souter"]
  gem.email         = ["p.morsou@gmail.com"]
  gem.description   = %q{Doc Parser for Puppet Modules. Returns Information about documentation.}
  gem.summary       = %q{Doc Parser for Puppet Modules. Returns Information about documentation.}
  gem.homepage      = "https://github.com/petems/puppet-doc-lint"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "puppet-doc-lint"
  gem.require_paths = ["lib"]
  gem.version       = PuppetDocLint::VERSION

  gem.add_development_dependency 'rspec', '~> 2.14.1'
  gem.add_development_dependency 'rake', '~> 10.1.1'
  gem.add_runtime_dependency 'rdoc', '>=3.12', '<4.0'
  gem.add_runtime_dependency 'facter', '~> 1.6'
  gem.add_runtime_dependency 'puppet', '~> 3.4.2'
  gem.add_runtime_dependency 'virtus', '~> 1.0.1'


end
