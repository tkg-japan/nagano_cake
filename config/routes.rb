Rails.application.routes.draw do

 devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers, skip: [:passwords,], controllers: {
    registrations: 'customer/registrations',
    sessions: 'customer/sessions'
  }

 namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :genres, except: [:show, :destroy, :new]
    resources :orders, only: [:index, :show, :update] do
      resources :order_details, only: [:update]
    end
  end


    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'

    resources :items, only: [:index, :show]

    resource :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
      resources :cart_items, only: [:index, :create, :update, :destroy] do
        collection do
          delete 'destroy_all'
        end
      end
      resources :addresses, except: [:new, :show]
    end

    resources :orders,only: [:create, :index, :show, :new] do
      collection do
        get 'complete'
        post 'confirm'
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
