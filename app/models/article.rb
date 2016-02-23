class Article < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :image,
										styles: { thumb: "360x258#", normal: "570x337#" },
										default_url: "article-:style.jpg",
										convert_options: { thumb: "-quality 75 -strip", normal: "-quality 75 -strip" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def text_short
		short = self.t(:text).html_safe[0..150]
		if short < self.t(:text).html_safe
			short << '&hellip;'
		end
		short.html_safe
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
