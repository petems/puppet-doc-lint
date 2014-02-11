require 'puppet-doc-lint'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

def setup(file)
  runner = PuppetDocLint::Runner.new
  manifests = [ file ]
  runner.run(manifests)
end

def setup_folder(files)
  runner = PuppetDocLint::Runner.new
  runner.run(files)
end