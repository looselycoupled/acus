class Page < ActiveRecord::Base

  include Sluggable
  has_ancestry

  # Attributes
  
  attr_accessible :content, :menu_priority, :slug, :teaser, :title, :parent_id
  
  # friendly path based on title slug
  friendly_id :title, use: :slugged
  
  validates :title, {
    presence: true,
    length: { in: 3..100}
  }
  
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
