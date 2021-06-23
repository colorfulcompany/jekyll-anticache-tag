$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "jekyll"
require "jekyll-anticache-tag"

require "minitest/autorun"
require "minitest-power_assert"
require "minitest/reporters"

require "byebug"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
