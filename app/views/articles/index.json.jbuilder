json.array!(@articles) do |article|
  json.extract! article, :id, :title, :title_en, :text, :text_en, :slug
  json.url article_url(article, format: :json)
end
