class CartsController < ApplicationController
  before_action :find_cart, except: %w[index]
  before_action :find_item, only: %w[increase_quantity decrease_quantity]
  include CartsHelper

  #fetch all the record(object) of cart
  def index
    @carts = Cart.all
  end

  #increase the quantity if clicked increase button from front-end
  def increase_quantity
    quantity = @item.quantity + 1
    update_quantity(@item, quantity, @cart.id) #calling function from carts_helper
  end

  #decrease the quantity if clicked decrease button from front-end
  def decrease_quantity
    quantity = @item.quantity - 1
    update_quantity(@item, quantity, @cart.id) #calling function from carts_helper
  end

  #show all the cart-items
  def show
    cart_id = params[:id]
    @cart_name = @cart.title
    @item = Item.get_items(cart_id)
    @total_price = get_total_price(@item) #calling function from carts_helper
  end

  #delete the record of card, we can also use act_as_paranoid gem for soft deletion but not required here
  def destroy
    if @cart.present?
      if @cart.destroy!
        flash[:success] = "Cart Deleted successful"
        redirect_to carts_index_path
      else
        flash[:danger] = "Cart Not Deleted"
      end
    else
      redirect_to carts_index_path
    end
  end


  private

  #apply filter for this function to reuse
  def find_cart
    @cart = Cart.find_by(id: params[:id])
  end

  #apply filter for this function to reuse
  def find_item
    @item = Item.find_by(id: params[:item_id])
  end
end
