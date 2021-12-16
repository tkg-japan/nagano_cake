Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  get 'cart_items/index'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/complete'
  get 'items/index'
  get 'items/show'
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
