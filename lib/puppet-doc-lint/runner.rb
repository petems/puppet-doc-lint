class PuppetDocLint
  class Runner
    def initialize  
    end
  
    def run(files)
      runner_results = []
      files.each do |file|
        puppet_file_result = Result.new 
        Puppet.initialize_settings unless Puppet.settings.app_defaults_initialized?
        content          = PuppetDocLint::Parser.new(file)
        next if content.instance_variable_get('@object').nil?
        parameters = (defined? content.parameters) ? content.parameters.paramflat : nil
        puppet_file_result.class_name = content.klass
        content.docs == {} ? puppet_file_result.no_documentation = true : puppet_file_result.no_documentation = false
        result           = {
          content.klass  => {
            'parameters' => parameters,
            'docs'       => content.docs
          }
        }
        puts "class #{content.klass} Parameters are #{parameters.keys}"
        puts "class #{content.klass} Docs found are #{content.docs.keys}"
        undocumented = parameters.keys - content.docs.keys
        puts "class #{content.klass} The following parameters are undocumented #{undocumented}" unless undocumented.empty?
        puppet_file_result.file_name = file
        puppet_file_result.parameters = parameters.keys
        documented = parameters.keys - undocumented
        undocumented = parameters.keys - content.docs.keys
        puppet_file_result.undocumented_parameters = undocumented unless undocumented.empty?
        puppet_file_result.documented_parameters = documented unless undocumented.empty?
        runner_results << puppet_file_result        
      end
      runner_results
    end
    
  end #class DocRunner
end #module PuppetDocLint
