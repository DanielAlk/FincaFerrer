class AddTextEnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :text_en, :text
  end
end
