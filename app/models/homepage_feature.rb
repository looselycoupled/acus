class HomepageFeature < ActiveRecord::Base
  attr_accessible :content, :link, :link_text, :super_title, :title, :image

  has_attached_file :image, 
    :url => "/features/:id/:basename-:style.:extension",
    :path => "/features/:id/:basename-:style.:extension",
    :styles => { :full => ["300x200#", :png], :thumbnail => ["150x100#", :png] }

  # SCOPES
  
  scope :recent, order("updated_at desc").limit(3)

end
