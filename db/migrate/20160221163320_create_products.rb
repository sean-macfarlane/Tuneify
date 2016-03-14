class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.decimal :saleprice
      t.boolean :isonsale
	 t.integer :category_id
      t.timestamps null: false
    end
  end

def self.down
      drop_table :products
   end

end
