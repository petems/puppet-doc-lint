require 'virtus'

class PuppetDocLint
  class Result
    include Virtus.model
    attribute :class_name, String
    attribute :file_name, String
    attribute :parameters, String
    attribute :no_documentation, Boolean
    attribute :documented_parameters,   String
    attribute :undocumented_parameters, String
  end #class Result
end #module PuppetDocLint
