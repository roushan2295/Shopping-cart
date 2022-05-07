Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'carts#index'
  get 'carts/index', to: 'carts#index'
  get 'carts/:id', to: 'carts#show', as: 'show_cart'
  delete 'carts/:id', to: 'carts#destroy', as: 'delete_cart'
  patch 'carts/increase/:id', to: 'carts#increase_quantity', as:'increase_quantity'
  patch 'carts/decrease/:id', to: 'carts#decrease_quantity', as:'decrease_quantity'
end
