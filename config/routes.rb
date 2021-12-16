Rails.application.routes.draw do
  get 'addresses/index'
  get 'addresses/edit'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/unsubscribe'
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
