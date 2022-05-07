module CartsHelper
  #calculate total price for an item
  def get_total_price(items)
    total_price = []
    items.each do|item|
      total_price << (item.price) * (item.quantity)
    end
    total_price.sum
  end

  #update quantity of an item
  def update_quantity(item,quantity, cart_id)
    if item.update!(quantity: quantity)
      flash[:success] = "Quantity Updated Successful"
      redirect_to show_cart_path(cart_id)
    else
      flash[:danger] = "Quantity Not Updated"
    end
  end

end
