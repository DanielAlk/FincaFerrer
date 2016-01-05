module ApplicationHelper
	def head_allow_robots?
		true
	end

	def head_title
		case params['action']
		when 'home'
			'Home | Finca Ferrer'
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
end
