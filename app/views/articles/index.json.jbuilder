json.array!(@articles) do |article|
  json.extract! article, :id, :title, :text, :slug
  json.url article_url(article, format: :json)
end
