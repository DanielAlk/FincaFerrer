module ApplicationHelper
	def head_allow_robots?
		true
	end

	def head_title
		case params['action']
		when 'about'
			'Nuestra Bodega | Finca Ferrer'
		when 'news'
			'Novedades | Finca Ferrer'
		when 'awards'
			'Premios | Finca Ferrer'
		when 'contact'
			'Contacto | Finca Ferrer'
		else
			'Finca Ferrer'
		end
	end

	def head_description
		''
	end

	def head_og_image
		''
	end

	def nav_class(action = nil)
		'active' if action == params['action']
	end

	def main_image
		case params['action']
		when 'about'
			asset_path 'field-and-mountains-big.jpg'
		when 'awards'
			asset_path 'field-and-houses.jpg'
		else
			asset_path 'graves.jpg'
		end
	end
end
