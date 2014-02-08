class PuppetDocLint
  class Runner
    def initialize
    end
  
    def run(files)
      output = {}
      files.each do |file|
        Puppet.initialize_settings unless Puppet.settings.app_defaults_initialized?
        content          = PuppetDocLint::Parser.new(file)
        next if content.instance_variable_get('@object').nil? 
        parameters = (defined? content.parameters) ? content.parameters.paramflat : nil
        result           = {
          content.klass  => {
            'parameters' => parameters,
            'docs'       => content.docs
          }
        }
        output = output.merge(result)
      end
      output
    end
    
    
  end #class Runner
end #module PuppetDocLint
