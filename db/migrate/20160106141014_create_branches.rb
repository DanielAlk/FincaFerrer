class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :title
      t.text :text
      t.string :color
      t.attachment :logo
      t.attachment :image
      t.string :slug

      t.timestamps null: false
    end
    add_index :branches, :slug, unique: true
  end
end
