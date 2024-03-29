# begin
#   require 'pry'
# rescue LoadError
# end
require 'rspec'

require File.expand_path '../../lib/mongoid_settings', __FILE__

def database_id
    ENV['CI'] ? "mongoid_settings_#{Process.pid}" : 'mongoid_settings_test'
end

Mongoid.configure do |config|
  config.connect_to database_id
end

RSpec.configure do |c|
  c.before(:each) do
    Mongoid.purge!
    Mongoid::IdentityMap.clear
  end

  c.after(:suite) do
    Mongoid::Threaded.sessions[:default].drop if ENV['CI']
  end
end
