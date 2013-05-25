class Resource < ActiveRecord::Base
  attr_accessible :content, :slug, :teaser, :title, :photo

  # friendly path based on title slug
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :photo, {
    :styles => {
      :thumbnail => ['60x60', :jpg], 
      :display => ['200x200', :jpg] 
    },
    processors: %i[thumbnail jpegtran],
    convert_options: {
      all: "-strip -interlace Line -quality 65",
    }
  }
                    

  # Validations
  
  validates_attachment_content_type :photo, 
    :content_type => Shortline.const.valid_image_types,
    :message => "Sorry, that file type is not allowed."
  
  validates_attachment :photo, 
    :presence => true,
    :size => { :less_than => Shortline.const.maximum_image_size }
  
  validates :title, 
    presence: true
    
  validates :slug, 
    uniqueness: true, 
    exclusion: {in: Shortline.const.reserved_slugs}

end
