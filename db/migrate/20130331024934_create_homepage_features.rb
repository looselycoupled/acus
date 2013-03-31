class CreateHomepageFeatures < ActiveRecord::Migration
  def change
    create_table :homepage_features do |t|
      t.string :title
      t.text :content
      t.string :super_title
      t.string :link
      t.string :link_text

      t.timestamps
    end
  end
end
