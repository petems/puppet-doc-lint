class PuppetDocLint
  class DocRunner
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
        puppet_file_result.no_documentation = true if content.docs == {}
        result           = {
          content.klass  => {
            'parameters' => parameters,
            'docs'       => content.docs
          }
        }
        puppet_file_result.parameters = parameters.keys
        undocumented = parameters.keys - content.docs.keys
        puppet_file_result.undocumented_parameters = undocumented unless undocumented.empty?
        documented = parameters.keys - undocumented
        puppet_file_result.documented_parameters = documented unless undocumented.empty?
        runner_results << puppet_file_result        
      end
      runner_results
    end
    
    
  end #class Runner
end #module PuppetDocLint
