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
        puts "#{file} has no documentation" if content.docs == {}
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
        output = output.merge(result)
      end
      output
    end
    
    
  end #class Runner
end #module PuppetDocLint
