class CartController < AuthenticatedController
	before_action :logged_in!

	def add
		id = params[:id]
			if session[:cart]
				cart = session[:cart]
			else 
				session[:cart] = {}
				cart = session[:cart]
			end
			
			if cart[id] 
				cart[id] = cart[id] + 1
			else	
				cart[id] = 1
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
	
	def checkout
		@checkout_url = "http://tuneify-2.myshopify.com/cart/"
		@cart.each do |id|
			product = Product.find_by_id(id)
			@checkout_url << product.shopify_id << ":1,"
		end
		redirect_to @checkout_url
	end
end
	