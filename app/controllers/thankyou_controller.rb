class ThankyouController < AuthenticatedController

	def index
		if session[:cart] 
			session.delete(:cart)
		end
	end
end
	