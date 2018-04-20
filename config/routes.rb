Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :merchants, except: [:edit, :update, :destroy] do
    resources :products
    resources :orders
  end

  resources :categories, only: [:new, :create]

end
