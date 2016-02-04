$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "assert_triggering/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "assert_triggering"
  s.version     = AssertTriggering::VERSION
  s.authors     = ["Grigoriy Dobryakov"]
  s.email       = ["grigoriydobryakov@gmail.com"]
  s.homepage    = "https://github.com/dobryakov/assert_triggering"
  s.summary     = "Gem for DelayedJob observing in Rails unit tests."
  s.description = "Allows to write 'assert_triggered event_name' in your tests."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
