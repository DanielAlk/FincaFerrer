class AddPurchaseUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :purchase_url, :string
  end
end
