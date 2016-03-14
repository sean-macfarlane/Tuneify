class Adduserids < ActiveRecord::Migration
  def change
	remove_column :products, :price
	remove_column :products, :saleprice
	remove_column :products, :isonsale
	add_column :products, :user_id, :int
  end
end
