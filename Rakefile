require 'rake/testtask'

desc "Look for style guide offenses in your code"
task :rubocop do
  sh "rubocop --format simple || true"
end

desc "Run unit tests"
Rake::TestTask.new(:unit_test) do |t|
  t.libs << 'app'
  t.libs << 'test'
  t.test_files = FileList['test/unit/test_*.rb']
end

desc "Run unit tests in verbose mode"
task :unit_test_verbose do
  sh 'rake unit_test TESTOPTS="--verbose"'
end

desc "Run system tests"
Rake::TestTask.new(:system_test) do |t|
  t.libs << 'app'
  t.libs << 'test'
  t.test_files = FileList['test/system/system_test.rb']
end

desc "Run system tests in verbose mode"
task :system_test_verbose do
  sh 'rake system_test TESTOPTS="--verbose"'
end

task default: [:rubocop, :unit_test, :system_test]
task test_verbose: [:rubocop, :unit_test_verbose, :system_test_verbose]
