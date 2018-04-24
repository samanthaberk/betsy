Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#root'

  get '/auth/github', as: 'github_login'
  
  post '/logout', to: 'sessions#logout', as: 'logout'
  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'

  resources :products do
    resources :reviews, only: [:new, :show, :create]
  end

  resources :orders, only: [:show, :new, :create]

  # may not need all routes for order_products
  resources :order_products
  resource :cart, only: [:show]

  resources :categories, only: [:new, :create, :index, :show] do
    resources :product, only: [:root]
  end

  resources :merchants, except: [:edit, :update, :destroy] do
    resources :products, only: [:index]
    resources :orders, only: [:index]
  end

end
