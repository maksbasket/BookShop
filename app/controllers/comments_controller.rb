class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @product = Product.find(params[:product_id])
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.product_id = params[:product_id]
    @product = @comment.product
    if @comment.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end
end
