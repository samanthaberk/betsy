Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#root'

  post '/products/:id/add_review', to: 'products#create_review', as: :create_review

  get '/auth/github', as: 'github_login'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'

  resources :products, except: [:edit, :update] do
    resources :reviews, only: [:new, :show, :create]
  end

  resources :orders, only: [:show, :new, :create]

  get '/checkout', to: 'carts#edit', as: :checkout
  get '/placeorder', to: 'carts#update', as: :place_order

  # may not need all routes for order_products
  resources :order_products
  resource :cart, only: [:show]

  resources :categories, only: [:new, :create, :index, :show] do
    resources :product, only: [:root]
  end

  resources :merchants, except: [:edit, :update, :destroy] do
    resources :products, only: [:index, :new]
    resources :orders, only: [:index]
  end

end
