# -*- encoding: utf-8 -*-
require File.expand_path('../lib/puppet-doc-lint/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Johan van den Dorpe"]
  gem.email         = ["johan.vandendorpe@gmail.com"]
  gem.description   = %q{Parse Puppet modules for classes, defines, parameters and documentation}
  gem.summary       = %q{Parser for Puppet Modules. Returns Information about available classes and defines, their parameters, and documentation for those parameters.}
  gem.homepage      = "https://github.com/johanek/puppet-doc-lint"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "puppet-doc-lint"
  gem.require_paths = ["lib"]
  gem.version       = PuppetDocLint::VERSION

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_runtime_dependency "rdoc", ">=3.12", "<4.0"
  gem.add_runtime_dependency "facter"
  gem.add_runtime_dependency "puppet"
  gem.add_runtime_dependency "virtus"


end
