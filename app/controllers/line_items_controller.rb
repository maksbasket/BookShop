class LineItemsController < ApplicationController

  # POST /line_items
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
  
    if @line_item.save
      self.counter = 0
      redirect_to cart_path
    else
      redirect_to root_path, :notice => 'Cant add line item'
    end
  end

  def destroy
    line_item = current_cart.line_items.find(params[:id])
    line_item.destroy
    flash[:notice] = "Line item was removed"
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Can't remove this line_item"
  ensure
    redirect_to cart_path
  end
end
