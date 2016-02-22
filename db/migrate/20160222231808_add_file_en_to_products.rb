class AddFileEnToProducts < ActiveRecord::Migration
	def up
		add_attachment :products, :file_en
	end

	def down
		remove_attachment :products, :file_en
	end
end
