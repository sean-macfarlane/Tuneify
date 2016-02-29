class ThankyouController < AuthenticatedController

	def index
		if session[:cart] 
			@cart = session[:cart]
		else
			redirect_to root_path
		end
	end
end
	