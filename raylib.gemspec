# frozen_string_literal: true

require_relative "lib/raylib/version"

Gem::Specification.new do |spec|
  spec.name = "raylib"
  spec.version = Raylib::VERSION
  spec.authors = ["Wilson Silva"]
  spec.email = ["wilson.dsigns@gmail.com"]

  spec.summary = "Ruby language bindings for the raylib C game engine."
  spec.description = "raylib is a simple and easy-to-use C library for enjoying videogames programming. This gem provides Ruby language bindings for raylib, making it easier to develop games in Ruby using raylib."
  spec.homepage = "https://github.com/wilsonsilva/raylib"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wilsonsilva/raylib"
  spec.metadata["changelog_uri"] = "https://github.com/wilsonsilva/raylib/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ffi", "~> 1.16"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.57"
end
