require 'spec_helper'

class Settings
  include Mongoid::Settings
end

describe Mongoid::Settings do
  before :each do
    Settings.clear
  end

  describe '::current' do
    it 'returns the current settings document' do
      expect(Settings.current).to be_kind_of Settings
    end
  end
  
  describe '[]=' do
    it "sets a value for a key" do
      Settings[:foo] = 2
      expect(Settings.current.settings[:foo]).to eq 2
    end
  end
  
  describe '[]' do
    it "retrieves a value for a setting" do
      expect {
        Settings[:foo] = 2
        }.to change {Settings[:foo]}.from(nil).to(2)
    end
  end
      
  describe 'clear' do
    it "clears all of the values" do
      Settings[:foo] = 2
      expect {
        Settings.clear
      }.to change {Settings[:foo]}.to nil
    end
  end
      
end
