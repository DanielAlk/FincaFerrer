module ApplicationHelper
	def head_allow_robots?
		true
	end

	def head_title
		case params['action']
		when 'about'
			'Nuestra Bodega | Finca Ferrer'
		when 'branches'
			'Productos | Finca Ferrer'
		when 'products'
			@branch.title + ' | Finca Ferrer'
		when 'news'
			'Novedades | Finca Ferrer'
		when 'news_article'
			@article.title + ' | Finca Ferrer'
		when 'awards'
			'Premios | Finca Ferrer'
		when 'contact'
			'Contacto | Finca Ferrer'
		else
			'Finca Ferrer'
		end
	end

	def head_description
		'Finca Ferrer ubicada a 1310 metros de altura, en Gualtallary, Tupungato, Valle de Uco, Mendoza, elabora prestigiosos vinos mundialmente premiados.'
	end

	def head_keywords
		'Vino, Tupungato, Valle de Uco, Gualtallary, Mendoza, Bodega argentina, Malbec, Pinot Noir, 1310, Acordeon, Viento Sur, Doscumbres.'
	end

	def head_og_image
		''
	end

	def nav_class(action = nil)
		if action.kind_of? Array
			'active' if action.include? params['action']
		else
			'active' if action == params['action']
		end
	end

	def main_image
		case params['action']
		when 'about'
			asset_path 'field-and-mountains-big.jpg'
		when 'awards'
			asset_path 'field-and-houses.jpg'
		when 'products'
			asset_path 'sunrise.jpg'
		when 'branches'
			asset_path 'sunrise.jpg'
		when 'news'
			asset_path 'field-and-clouds.jpg'
		when 'news_article'
			asset_path 'field-and-clouds.jpg'
		else
			asset_path 'graves.jpg'
		end
	end

	def main_image_class
		case params['action']
		when 'home'
			'main-image-content'
		else
			'main-image'
		end
	end

	def locale_class(l)
		'bold' if I18n.locale.to_s == l.to_s
	end

	def locale_href(l)
		if Rails.env.development?
			I18n.locale.to_s != l.to_s ? '?hl=' + l.to_s : 'javascript:void(0);'
		else
			if I18n.locale.to_s == l.to_s
				'javascript:void(0);'
			elsif l.to_s == 'es'
				request.url.sub request.host, request.host + '.ar'
			elsif l.to_s == 'en'
				request.url.sub request.host, request.host.sub('.com.ar', '.com')
			end
		end
	end
end
