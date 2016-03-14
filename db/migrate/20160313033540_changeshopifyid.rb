class Changeshopifyid < ActiveRecord::Migration
  def change
	change_column :products, :shopify_id,  :bigint 
  end
end
