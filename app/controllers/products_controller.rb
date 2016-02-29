class ProductsController < AuthenticatedController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end
  
  def list
    @products = Product.all
  end
  
  # GET /products/1
  # GET /products/1.json
  def show
	@product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
	@categories = Category.all
	@user_id = session[:user_id]
  end

  # GET /products/1/edit
  def edit
	if current_user 
		if @product.user_id != current_user.id
			redirect_to root_path
		end
	else 
		redirect_to root_path
	end
  
	@product = Product.find(params[:id])
     @categories = Category.all
  end
  
  def show_categories
      @category = Category.find(params[:id])
   end

  # POST /products
  # POST /products.json
  def create
    @categories = Category.all
	@product = Product.new(product_params)
	@product.user_id = current_user.id if current_user
	
	shop = ShopifyAPI::Shop.current
    new_product = ShopifyAPI::Product.new
	new_product.title = @product.name
	new_product.body_html = @product.description
	new_product.product_type = "Song"
	new_product.vendor = "Tuneify"

	new_product.variants = ShopifyAPI::Variant.new()	
	new_product.save 
	
	@product.shopify_id = new_product.variants[0].id
	
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, success: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, success: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, success: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category_id, :image, :audio, :price)
    end
end
