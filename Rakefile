require 'rake/testtask'

desc "Look for style guide offenses in your code"
task :rubocop do
  sh "rubocop --format simple || true"
end

desc "Run tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test_*.rb']
  t.options = ' --pride'
end

desc "Run tests in verbose mode"
task :test_verbose do
  sh 'rake test TESTOPTS="--verbose"'
end

task default: [:rubocop]
task :test
