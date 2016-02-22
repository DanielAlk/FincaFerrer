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