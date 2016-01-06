json.array!(@branches) do |branch|
  json.extract! branch, :id, :title, :text, :slug
  json.url branch_url(branch, format: :json)
end
