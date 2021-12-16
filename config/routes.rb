Rails.application.routes.draw do
  namespace :admin do

    get 'items/inde'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/index'
  end
    
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'homes/top'

  end
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
