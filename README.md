# puppet-doc-lint

[![Build Status](https://travis-ci.org/johanek/puppet-doc-lint.png)](http://travis-ci.org/johanek/puppet-doc-lint)

Analyse puppet manifests and report what classes and defines are specified, and their parameters and parameter documentation.

## Installation

    gem install puppet-doc-lint

## Requirements

    rdoc >=3.12, <4.0
    facter

## Supported Platforms

puppet-doc-lint only works on Unix like platforms such as Linux and MacOSX.

Windows is not supported.

## Usage

### By hand

You can report on one or more manifests by running

    puppet-doc-lint <path(s) to file(s)>

### Rake task

If you want to parse your entire modules directory, you can add
`require 'puppet-doc-lint/puppet-doc-lint' to your Rakefile and then run

    rake parse

If you need to ignore certain paths from being parsed:

``` ruby
PuppetDocLint.configuration.ignore_paths = ["vendor/**/*.pp"]
```

## Sample Output

    --- 
      ntp: 
        parameters: 
          enabled: true
          present: true
          enableboot: true
        docs: 
          enabled: 
            - "Set to 'false' to stop service"
          present: 
            - "Set to 'false' to remove package"
          enableboot: 
            - "Set to 'false' to prevent service starting at boot"



## Contributing

You can do any of these:

1. Create new Pull Request
2. Create an issue
3. Write me an email
4. Complain about how useless my code is on twitter

