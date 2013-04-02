class AddAttachmentImageToHomepageFeatures < ActiveRecord::Migration
  def self.up
    change_table :homepage_features do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :homepage_features, :image
  end
end
