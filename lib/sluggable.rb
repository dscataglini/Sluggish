require "sluggable/version"

module Sluggable
  def self.included(klass)
    klass.class_eval { @sluggable_finder_key = nil }
    klass.extend ClassMethods
  end
  
  module ClassMethods
    def [](slug)
      send(:"find_by_#{sluggable_finder}", slug.to_s)
    end
  
    def sluggit!(finder)
      @sluggable_finder_key = finder
    end
    
    def sluggable_finder
      @sluggable_finder_key || [:name, :slug, :key].detect{|k| self.respond_to?("find_by_#{k}")}
    end
  end  
  
end
