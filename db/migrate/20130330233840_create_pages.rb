class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.string :menu_priority
      t.string :teaser

      t.timestamps
    end
  end
end
