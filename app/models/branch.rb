class Branch < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged
	has_attached_file :logo,
										styles: { normal: "x100>" },
										convert_options: { normal: "-quality 75 -strip" }
	has_attached_file :image,
										styles: { normal: "x430" },
										default_url: "viento-sur-product.png",
										convert_options: { normal: "-quality 75 -strip" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
end
