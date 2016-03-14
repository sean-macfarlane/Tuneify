class AddPictureToProducts < ActiveRecord::Migration
  def change
	 change_table :products do |t|
      	t.attachment :image
    end
  end
end
