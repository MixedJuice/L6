class CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new(product_id: params[:product_id])
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to products_path
    else
      render :new
    end 
  end

  def destroy 
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy 
    redirect_to cart_path(@cart_item.cart_id)
  end 

  private 

  def cart_item_params 
    params.require(:cart_item).permit(:qty, :product_id, :cart_id)
  end 
end 
