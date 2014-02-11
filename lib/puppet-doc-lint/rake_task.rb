require 'puppet-doc-lint'
require 'rake'
require 'rake/tasklib'

desc 'Run puppet-doc-lint'
task :parse_doc do
  matched_files = FileList['**/*.pp']

  if ignore_paths = PuppetDocLint.configuration.ignore_paths
    matched_files = matched_files.exclude(*ignore_paths)
  end

  runner = PuppetDocLint::Runner.new
  results = runner.run(matched_files)

  results.each {|result| result.result_report}
end
