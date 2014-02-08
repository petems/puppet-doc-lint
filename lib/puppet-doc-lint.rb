require 'puppet'
require 'puppet-doc-lint/version'
require 'puppet-doc-lint/parser'
require 'puppet-doc-lint/runner'
require 'puppet-doc-lint/hash'
require 'puppet-doc-lint/configuration'
require 'rdoc'

class PuppetDocLint
  # Public: Access PuppetDocLint's configuration from outside the class.
  #
  # Returns a PuppetDocLint::Configuration object.
  def self.configuration
    @configuration ||= PuppetDocLint::Configuration.new
  end

  # Public: Access PuppetDocLint's configuration from inside the class.
  #
  # Returns a PuppetDocLint::Configuration object.
  def configuration
    self.class.configuration
  end
end
