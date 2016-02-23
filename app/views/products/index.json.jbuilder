json.array!(@products) do |product|
  json.extract! product, :id, :title, :title_en, :text, :text_en, :branch_id
  json.url product_url(product, format: :json)
end
