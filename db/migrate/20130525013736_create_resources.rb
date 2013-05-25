class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :slug
      t.text :teaser
      t.text :content

      t.timestamps
    end
  end
end
