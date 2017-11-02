class AddPositionToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :position, :integer
  end
end
