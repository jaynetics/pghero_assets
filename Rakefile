require "bundler/gem_tasks"
require "rspec/core/rake_task"

Dir['tasks/**/*.rake'].each { |file| load(file) }

RSpec::Core::RakeTask.new(:spec)

task default: [:generate_spec_app, :spec]
