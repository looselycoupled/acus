class Page < ActiveRecord::Base
  attr_accessible :content, :menu_priority, :slug, :teaser, :title
end
