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
      puts "Class name was: #{class_name}"
      puts "File name #{file_name}"
      puts "Parameters found #{parameters}"
      puts "No documentation error: #{no_documentation}"
      puts "Documented parameters found: #{documented_parameters}"
      puts "Undocumented parameters found: #{undocumented_parameters}\n\n"
    end

  end #class Result
end #module PuppetDocLint
