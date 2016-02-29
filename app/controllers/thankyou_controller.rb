class ThankyouController < AuthenticatedController

	def index
		if session[:cart] 
			@cart = session[:cart]
		else
			redirect_to root_path
		end
	end
	
	def download
	@product = Product.find(params[:id])
	
	  send_file @product.audio.url, filename: @product.audio_file_name, type: @product.audio_content_type, disposition: 'attachment'
	end
end
	