ShopifyApp.configure do |config|
  config.api_key = "2cccde181d6679e6ec5eb4c6c9afc718"
  config.secret = "19813a79a4bd9958c9f80a390509de71"
  config.redirect_uri = "http://tuneify-shop.herokuapp.com/auth/shopify/callback"
  config.scope = "read_orders, read_products, write_products, write_orders"
  config.embedded_app = true
end
