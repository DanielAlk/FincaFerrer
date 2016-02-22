class AddTextEnToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :text_en, :text
  end
end
