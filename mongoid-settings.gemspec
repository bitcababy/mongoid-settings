$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid/settings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid-settings"
  s.version     = Mongoid::Settings::VERSION
  s.authors     = ["Meredith Lesly"]
  s.email       = ["meredith@xoala.com"]
  s.homepage    = ""
  s.summary     = "Provides mongoid settings"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "mongoid", ["~> 3.0"]
  s.add_development_dependency 'rspec'
  s.files         = Dir.glob('lib/**/*') + %w(MIT-LICENSE README.rdoc)
  s.test_files    = Dir.glob('spec/**/*')
  s.require_paths = ['lib']
end
