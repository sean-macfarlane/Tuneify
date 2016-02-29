json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :saleprice, :isonsale
  json.url product_url(product, format: :json)
end
