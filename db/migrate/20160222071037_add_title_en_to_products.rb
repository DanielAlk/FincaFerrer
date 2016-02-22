class AddTitleEnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :title_en, :string
  end
end
