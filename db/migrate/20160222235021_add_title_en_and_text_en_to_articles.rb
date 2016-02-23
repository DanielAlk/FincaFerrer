class AddTitleEnAndTextEnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :title_en, :string
    add_column :articles, :text_en, :text
  end
end
