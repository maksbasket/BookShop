class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @product = Product.find(params[:product_id])
    respond_to do |format|
      format.html
      format.js
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.product_id = params[:product_id]
    @product = @comment.product
    comment.save
    respond_to do |format|
      format.html do
        if @comment.id
          redirect_to product_path(@product)
        else
          render :new
        end
      end
      format.js
    end
  end
end
