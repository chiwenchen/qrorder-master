Rails.application.routes.draw do


  #root 'restaurants#index'
  root to: "sessions#new"

  get '/register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:create]

  resources :restaurants, only: [:index, :show, :new, :create] do
    member do
      get :chef;
      get :waiter;
    end  
    resources :menus, only: [:index, :new, :create, :show, :edit, :update];
    resources :tables, only: [:show, :create];
  end 

  resources :tables, only: [:destroy] do
    member do
      post :order;
      post :place_order;
    end
  end

  resources :orders do
    member do
      patch :change_order_status;  
    end
  end

end
