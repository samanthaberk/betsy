Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#root'
  
  resources :products do
    resources :reviews, only: [:new, :show, :create]
  end

  resources :orders, only: [:show, :new, :create]

  resources :categories, only: [:new, :create, :index, :show] do
    resources :product, only: [:root]
  end

  resources :merchants, except: [:edit, :update, :destroy] do
    resources :products, only: [:index]
    resources :orders, only: [:index]
  end

end
