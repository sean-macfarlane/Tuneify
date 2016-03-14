class AddAudioToProducts < ActiveRecord::Migration
  def change
	add_attachment :products, :audio  
  end
end
