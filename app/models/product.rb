class Product < ActiveRecord::Base
  belongs_to :branch

	has_attached_file :file, default_url: ''
	has_attached_file :image,
										styles: { normal: "x250" },
										convert_options: { normal: "-quality 75 -strip" }
	validates_attachment_content_type :file, content_type: /\Aapplication\/pdf\Z/
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def download
		self.branch.title + ' ' + self.title
	end

end