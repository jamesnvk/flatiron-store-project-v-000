class LineItemsController < ApplicationController
  def create
    #binding.pry

    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @cart.add_item(params[:item_id]).save
    current_user.current_cart = @cart
    current_user.save
    redirect_to cart_path(current_user.current_cart_id)
  end

end
