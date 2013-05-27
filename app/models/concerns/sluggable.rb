module Sluggable
  extend ActiveSupport::Concern

  included do

    validates :slug, {
      :uniqueness => true, 
      :presence => true, 
      :length => { :in => 3..100 },
      :exclusion => {in: Shortline.const.reserved_slugs}
    }
    
  end
end
