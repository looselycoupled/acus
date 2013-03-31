class Page < ActiveRecord::Base
  attr_accessible :content, :menu_priority, :slug, :teaser, :title, :parent_id
  
  has_ancestry
  
  # friendly path based on title slug
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  validates :title, presence: true
  validates :slug, uniqueness: true #, presence: true , exclusion: {in: %w[signup login]}
  
  # Associations
  
  belongs_to :parent, :foreign_key => "ancestry", :class_name => "Page"
  
  def self.arrange_as_array(options={}, hash=nil)                                                                                                                                                            
    hash ||= arrange(options)
    arr = []
    hash.each do |node, children|
      arr << node
      arr += arrange_as_array(options, children) unless children.empty?
    end
    arr
  end

end
