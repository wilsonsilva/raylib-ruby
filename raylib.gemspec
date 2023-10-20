# frozen_string_literal: true

require_relative "lib/raylib/version"

Gem::Specification.new do |spec|
  spec.name = "raylib"
  spec.version = Raylib::VERSION
  spec.authors = ["Wilson Silva"]
  spec.email = ["wilson.dsigns@gmail.com"]

  spec.summary = "Ruby bindings for raylib, a simple and easy-to-use library to enjoy videogames programming."
  spec.description = "raylib is a simple and easy-to-use C library for enjoying videogames programming. This gem provides Ruby language bindings for raylib, making it easier to develop games in Ruby using raylib."
  spec.homepage = "https://raylib-ruby.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wilsonsilva/raylib-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/wilsonsilva/raylib-ruby/blob/main/CHANGELOG.md"

  spec.files = Dir['LICENSE.txt', 'README.md', 'lib/**/*']

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi", "~> 1.16"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.57"
end
