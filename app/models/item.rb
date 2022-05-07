class Item < ApplicationRecord
  belongs_to :cart
  scope :get_items, -> (cart_id) { where('cart_id = ?', cart_id) }
end