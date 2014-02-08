require 'puppet-doc-lint'
require 'rake'
require 'rake/tasklib'

desc 'Run puppet-doc-lint'
task :parse do
  matched_files = FileList['**/*.pp']

  if ignore_paths = PuppetDocLint.configuration.ignore_paths
    matched_files = matched_files.exclude(*ignore_paths)
  end

  runner = PuppetDocLint::Runner.new
  puts runner.run(matched_files)
end
