class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :text
      t.attachment :file
      t.attachment :image
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
