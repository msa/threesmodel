require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber)

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format html --out reports/rspec_results.html'
end

namespace :rspec_report do
  desc 'Run all specs and generate RSpec report in HTML'
  task :html => :spec

  desc 'Run all specs, generate RSpec report and open it in the browser'
  task :browser do
    Rake::Task[:spec].invoke
    `open reports/rspec_results.html` # This only works if running OS X.
  end
end
