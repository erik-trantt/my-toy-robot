require 'rake/testtask'

desc "Look for style guide offenses in your code"
task :rubocop do
  sh "rubocop --format simple || true"
end

Rake::TestTask.new(:test_unit) do |t|
  t.libs << 'app'
  t.libs << 'test'
  t.test_files = FileList['test/**/test_*.rb']
  t.options = '--verbose --color'
end

task default: [:rubocop]
task test: [:test_unit]