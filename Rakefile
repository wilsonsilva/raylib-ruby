# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

# If you're developing the generator, uncomment these lines and point it to your local copy of the generator
# require_relative "../raylib-generator/lib/raylib/generator"
# require_relative "../raylib-generator/lib/raylib/generator/tasks"
