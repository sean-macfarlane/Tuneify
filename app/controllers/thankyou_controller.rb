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

	  data = open(@product.audio.url) 
	  send_data data.read, filename: @product.audio_file_name, type: @product.audio_content_type, disposition: 'inline', stream: 'true', buffer_size: '4096' 
	end
end
	