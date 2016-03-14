class Newusers < ActiveRecord::Migration 
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
	t.string :password_digest	
	 t.attachment :image
      t.timestamps null: false
    end
  end
end