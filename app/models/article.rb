class Article < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :image,
										styles: { thumb: "360x258#", normal: "570x337#" },
										default_url: "article-:style.jpg",
										convert_options: { thumb: "-quality 75 -strip", normal: "-quality 75 -strip" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def text_short
		short = self.text[0..150]
		if short < self.text
			short << '&hellip;'
		end
		short.html_safe
	end
end
