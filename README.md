# DEPRECATED

This is now deprecated in favour of [Puppet Strings](https://github.com/puppetlabs/puppetlabs-strings)

# puppet-doc-lint

Lint your Puppet files for RDoc coverage

This project is heavily based on the [puppet-parse](https://github.com/johanek/puppet-parse) code base, go check it out! :smile:

## Assumptions

This assumes that you're formatting your documentation in Puppet with [RDoc formatting](http://rdoc.sourceforge.net/doc/).

For example _this_ will work:

```Rdoc
# == Class: foo
#
# This module manages foo
#
# === Parameters
#
# [*ensure*]
#   Controls presence of package and stuff
#
# === Authors
#
# * Jane Doe <mailto:jane.doe@fakecorp.com>
#
```

_This_ will not:

```
# Class: foo
#
# This module manages foo
#
# Parameters:
# 	- $ensure
#
# Authors: Jane Doe <mailto:jane.doe@fakecorp.com>
#
```

## Installation

    gem install puppet-doc-lint

## Usage

### By hand

You can report on one or more manifests by running

    puppet-doc-lint <path(s) to file(s)>

For example:
  
```
puppet-doc-lint ~/Projects/puppetlabs-firewall/manifests/linux/debian.pp
class firewall::linux::debian Parameters are ["ensure", "enable"]
class firewall::linux::debian Docs found are ["ensure", "enable"]
```

### Rake task

** Currrently broken maybe? **

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

