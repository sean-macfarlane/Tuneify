class CartController < ApplicationController
	before_action :logged_in!

	def add
		id = params[:id]
			if session[:cart]
				cart = session[:cart]
			else 
				session[:cart] = {}
				cart = session[:cart]
			end
			
			product = Product.find_by_id(id)
			if product				
				if !cart[id] 
					cart[id] = 1
				end
			end
		redirect_to :action => :index
	end

	def clearCart
		session.delete(:cart)
		redirect_to :action => :index
	end

	def index
		if session[:cart] 
			@cart = session[:cart]
		else
			@cart = {}
		end
	end
end
	