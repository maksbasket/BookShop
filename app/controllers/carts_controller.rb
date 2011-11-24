class CartsController < ApplicationController
 
  def show
    @cart = current_cart
  end

  def destroy
    current_cart.destroy
    session[:cart_id] = nil
    
    respond_to do |format|
      format.html { redirect_to root_path, 
                                :notice => 'Your cart is currently empty' }
      format.js
    end
  end
end
