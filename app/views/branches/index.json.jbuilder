json.array!(@branches) do |branch|
  json.extract! branch, :id, :title, :text, :text_en, :position, :slug
  json.url branch_url(branch, format: :json)
end
