# puppet-doc-lint

Lint your Puppet files for RDoc coverage

## Installation

    gem install puppet-doc-lint


## Usage

### By hand

You can report on one or more manifests by running

    puppet-doc-lint <path(s) to file(s)>

### Rake task

If you want to parse your entire modules directory, you can add
`require 'puppet-doc-lint/rake-task' to your Rakefile and then run

    rake parse

If you need to ignore certain paths from being parsed:

``` ruby
PuppetDocLint.configuration.ignore_paths = ["vendor/**/*.pp"]
```

## Contributing

You can do any of these:

1. Create new Pull Request
2. Create an issue
3. Write me an email
4. Complain about how useless my code is on twitter

