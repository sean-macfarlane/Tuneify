class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	  t.string :name
      t.text :description
      t.decimal :price
	  t.integer :category_id
	  t.integer :user_id
	  t.attachment :image
	  t.attachment :audio
      t.timestamps null: false
    end
  end
end
