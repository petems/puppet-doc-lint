require 'virtus'

class PuppetDocLint
  class Result
    include Virtus.model
    attribute :class_name, String
    attribute :file_name, String
    attribute :parameters, String
    attribute :no_documentation, Boolean, :default => false
    attribute :documented_parameters,   String, :default => []
    attribute :undocumented_parameters, String, :default => []
    attribute :documented_parameter_no_assignment, String, :default => []
    attribute :authors, String, :default => []

    def result_report
      puts "Class #{class_name} ( #{file_name} )"
      puts "Parameters found #{parameters}"
      if no_documentation
        puts "No documentation error."
        puts "If there is documentation, this may be a bug with the Puppet parser"
        puts "Puppet files with newer features such as the use of hashes can cause this\n\n"
      else
        puts "Documented parameters found: #{documented_parameters}"
        puts "Undocumented parameters found: #{undocumented_parameters}"
        puts "Parameters with Documentation but no defintion: #{documented_parameter_no_assignment}"
        puts "Authors: #{authors}\n\n"
      end
    end

  end #class Result
end #module PuppetDocLint
