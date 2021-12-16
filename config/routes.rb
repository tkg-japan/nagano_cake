Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :cart_items,only: [:index, :create, :update, :destroy, :destroy_all]

  resources :orders,only: [:create, :index, :show, :new]
  get 'orders/complete' => 'public/orders#complete'
  post 'orders/confilm' => 'public/orders#confilm'

  resources :items,only: [:index, :show]

  resources :addresses,only: [:index, :edit, :create, :update, :destroy]

  resources :customers,only: [:show, edit, :update]
  patch 'customers/withdraw' => 'public/customers#withdraw'

  get 'customers/unsubscribe' => 'public/customers#unsubscribe'

  namespace :admin do

    resources :items,only: [:index, :show, :edit, :update, :create, :new]

    resources :customers,only: [:index, :show, :edit, :update]

    resources :genres,only: [:index, :create, :edit, :update]

    resources :orders,only: [:show, :update]

    root to: 'homes#top'

  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
