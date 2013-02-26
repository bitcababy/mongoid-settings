module Mongoid
  module Settings
    extend ActiveSupport::Concern
    
    included do
      include Mongoid::Document
      cattr_accessor :current
      field :namespace, type: String, default: ""
      field :settings, type: Hash, default: {}
      attr_readonly :namespace

      class << self
        def current
          return @current ||= self.create
        end
        def clear
          self.current.settings.clear
          self.current.save!
        end
  
        def []=(k,v)
          self.current.settings[k] = v
          self.current.save!
        end
        alias set []=
      
        def [](k)
          self.current.settings[k]
       end
       alias get []
      
       def delete(k)
         self.current.settings.delete(k)
         self.save
       end
  
    end
  
    module ClassMethods

    end  #ClassMethods

  end
end
