Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products

  resources :orders, only: [:show, :new, :create]

  resources :categories, only: [:new, :create]
  
  resources :merchants, except: [:edit, :update, :destroy] do
    resources :products, only: [:index]
    resources :orders, only: [:index]
  end

end
