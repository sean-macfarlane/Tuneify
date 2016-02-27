ShopifyApp.configure do |config|
  config.api_key = "6638f129de6d5fc5b4ce3009ae5136fc"
  config.secret = "84587a678a4a9b626727d40d9cc70c51"
  config.redirect_uri = "http://tuneify-shop.herokuapp.com/auth/shopify/callback"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
