class Page < ActiveRecord::Base
  attr_accessible :content, :menu_priority, :slug, :teaser, :title
  
  has_ancestry
  
  # friendly path based on title slug
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true
  validates :slug, uniqueness: true #, presence: true , exclusion: {in: %w[signup login]}
end
