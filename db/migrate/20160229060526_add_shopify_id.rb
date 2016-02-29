class AddShopifyId < ActiveRecord::Migration
  def change
	add_column :products, :shopify_id, :int
  end
end
