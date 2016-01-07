class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.attachment :image
      t.string :slug

      t.timestamps null: false
    end
    add_index :articles, :slug, unique: true
  end
end
