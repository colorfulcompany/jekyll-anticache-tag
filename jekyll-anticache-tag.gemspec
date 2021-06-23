lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll/anticache_tag/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-anticache-tag"
  spec.version       = Jekyll::Anticache::VERSION
  spec.authors       = [""]
  spec.email         = [""]

  spec.summary       = %q{A simple Jekyll tag for cache busting.}
  spec.description   = %q{add unixtime query string for assets every build.}
  spec.homepage      = "https://github.com/colorfulcompany/jekyll-anticache-tag"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-power_assert"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "jekyll", "> 3"
  spec.add_development_dependency "liquid", "> 4"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "yard"
end
