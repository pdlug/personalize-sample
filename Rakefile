require 'rubygems'
require 'bundler/setup'
Bundler.setup(:default, :development, :test)
require 'rspec/core/rake_task'

task default: :spec

desc 'Run unit specs'
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ['--format', 'documentation', '--colour']
end
