# = Class: parameters_rdoc
#
# A class for testing puppet-doc-lint
#
# == Requirements
#
# None
#
# == Parameters
#
# [*param_one*]
#    Param1 documentation text
#
# == Authors
#
# Some Author <some@author.com>
#
class parameters_rdoc (
  $param_one = true,
  $param_two = '',
  $param_three = $::fqdn,
  $param_four
) {
  # no content
}
