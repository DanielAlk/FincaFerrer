class Branch < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_list
	
	has_many :products, dependent: :destroy

	has_attached_file :logo,
										styles: { normal: "x100>" },
										convert_options: { normal: "-quality 75 -strip" }
	has_attached_file :image,
										styles: { normal: "x430" },
										default_url: "viento-sur-product.png",
										convert_options: { normal: "-quality 75 -strip" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

	validates :position, presence: true

	def t(attribute_name, locale = nil)
		if locale.present?
			locale = locale.to_s == 'es' ? '' : '_' + locale.to_s
		end
		if !!locale and self[attribute_name.to_s + locale].present?
			self[attribute_name.to_s + locale]
		elsif I18n.locale != :es and self[attribute_name.to_s + '_' + I18n.locale.to_s].present?
			self[attribute_name.to_s + '_' + I18n.locale.to_s]
		else
			self[attribute_name.to_s]
		end
	end
end
