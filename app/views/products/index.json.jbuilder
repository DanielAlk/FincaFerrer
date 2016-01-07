json.array!(@products) do |product|
  json.extract! product, :id, :title, :text, :branch_id
  json.url product_url(product, format: :json)
end
