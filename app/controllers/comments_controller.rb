class CommentsController < ApplicationController

def create
	@product = Product.find(params[:product_id])
	@comment = @product.comments.create(comment_params)
	@comment.user_id = session[:user_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, success: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
	@comment = Comment.find(params[:id])
	@product = Product.find(params[:product_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @product, success: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text)
    end

end
