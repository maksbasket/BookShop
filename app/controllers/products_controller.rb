class ProductsController < ApplicationController

  load_and_authorize_resource

  # GET /products/1
  def show
    @product = Product.find(params[:id])
  end
  
  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  def create
    if @product.save
      redirect_to @product, notice: 'Product was successfully created'
    else
      render :new
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])
    flash[:notice] = @product.errors.to_a.join(", ") unless @product.destroy
    redirect_to products_url
  end

  def who_bought    
    respond_to do |format|
      format.atom
    end
  end   
end
