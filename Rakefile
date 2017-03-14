require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:cucumber) do |t|

  #t.cucumber_opts = '--format Fivemat'
end

RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--format Fivemat'
end

RSpec::Core::RakeTask.new(:htmlspec) do |t|
  t.rspec_opts = '--format html --out reports/rspec_results.html'
end

task :default => :spec

task :test => [:cucumber, :spec]

namespace :rspec_report do
  desc 'Run all specs, generate RSpec report and open it in the browser'
  task :browser do
    Rake::Task[:htmlspec].invoke
    `open reports/rspec_results.html` # This only works if running OS X.
  end
end
