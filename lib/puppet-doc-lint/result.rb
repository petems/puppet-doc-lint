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

    def result_report
      puts "===================================="
      puts "Class #{class_name} ( #{file_name} )".bg_blue
      puts "Parameters found #{parameters}"
      if no_documentation
        puts "No documentation found."
        puts "If there is documentation, this may be a bug with the Puppet parser"
        puts "Puppet files with newer features such as the use of hashes can cause this\n\n"
      else
        puts "Documented parameters found: #{documented_parameters}".green
        puts "Undocumented parameters found: #{undocumented_parameters}".red
        puts "Parameters with Documentation but no defintion: #{documented_parameter_no_assignment}".red unless authors.empty?
        puts "Documentation Coverage: #{percent_documented}%"
        puts "Authors: #{authors}" unless authors.empty?
      end
    end

    def percent_documented
      if documented_parameters.size == 0
        100
      else
        documented_parameters.size.percent_of(parameters.size).round(2)
      end
    end

  end #class Result
end #module PuppetDocLint
