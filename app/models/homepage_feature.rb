class HomepageFeature < ActiveRecord::Base
  attr_accessible :content, :link, :link_text, :super_title, :title

  # SCOPES
  
  scope :recent, order("updated_at desc").limit(3)

end
