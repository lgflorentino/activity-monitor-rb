# frozen_string_literal: true

require_relative "lib/activity_monitor/version"

Gem::Specification.new do |spec|
  spec.name = "activity-monitor-rb"
  spec.version = ActivityMonitor::VERSION
  spec.authors = ["lgflorentino"]
  spec.email = ["82384021+lgflorentino@users.noreply.github.com"]

  spec.summary = "Activity Monitor backend for Ruby"
  spec.description = "This is a backend for monitoring webhooks sent from git SCM platforms such as Github, Gitlab, Codeberg etc."
  spec.homepage = "https://github.com/lgflorentino/activity-monitor-rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lgflorentino/activity-monitor-rb"
  spec.metadata["changelog_uri"] = "https://github.com/lgflorentino/activity-monitor-rb/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "config"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
