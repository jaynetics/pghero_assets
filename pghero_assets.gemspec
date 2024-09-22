# frozen_string_literal: true

require_relative 'lib/pghero_assets/version'

Gem::Specification.new do |spec|
  spec.name = 'pghero_assets'
  spec.version = PgHeroAssets::VERSION
  spec.authors = ['Janosch Müller']
  spec.email = ['janosch84@gmail.com']

  spec.summary = 'Run PgHero without asset pipeline.'
  spec.homepage = 'https://github.com/jaynetics/pghero_assets'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) || f.start_with?(*%w[bin/ spec/ tasks/ .git .github Gemfile])
    end
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'pghero', '>= 3.6.0'
end
