class LineItemsController < ApplicationController

  # POST /line_items
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(:product => product)
  
    if @line_item.save
      self.counter = 0
      redirect_to cart_path, notice: 'Line item was successfully created.' 
    else
      render action: "new" 
    end
  end
end
