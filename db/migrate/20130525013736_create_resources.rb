class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :slug
      t.text :teaser
      t.text :content
      t.attachment :photo
      t.timestamps
    end
    add_index :resources, :slug
  end
end
