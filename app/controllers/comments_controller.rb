class CommentsController < ApplicationController
 
  def show
  end
  
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find params[:product_id]
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_comment_path(@product)
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :product_id)
  end
end
