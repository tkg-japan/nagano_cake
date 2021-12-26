Rails.application.routes.draw do

 devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: 'customer/registrations',
    sessions: 'customer/sessions'
  }
#管理者側
 namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :genres, except: [:show, :destroy, :new]
    resources :orders, only: [:index, :show, :update] do
     resources :order_details, only: [:index, :update]
    end
  end

#顧客側
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    resources :addresses, except: [:new, :show]

    resources :orders,only: [:create, :index, :show, :new] do
      collection do
        get 'complete'
        post 'confirm'
      end
    end

    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :items, only: [:index, :show]

    scope module: :customer do
      get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
      resource :customers, only: [:show]
      get 'customer/edit' => 'customers#edit'
      put 'customer/update' => 'customers#update'
      patch 'customer/update' => 'customers#update'
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
