class ThankyouController < ApplicationController
	before_action :logged_in!

	def index
		if session[:cart] 
			@cart = session[:cart]
			session.delete(:cart)
		else 
			redirect_to root_path
		end
	end
	
	def download 
		id = params[:id]
		product = Product.find_by_id(id)
		file = open(product.audio.url)
		send_file(file, :filename => product.audio_file_name, :type => "application/mp3" , :disposition =>      "attachment")
	end
	
end
	