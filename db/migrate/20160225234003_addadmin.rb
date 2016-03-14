class Addadmin < ActiveRecord::Migration
  def change
	add_column :users, :isAdmin, :int
  end
end
