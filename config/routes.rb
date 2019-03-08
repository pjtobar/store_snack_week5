Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :details
  post "details/cart" => "details#cart"
  get "details/pay/:id", to: 'details#pay', as: 'pay'
  # get '/products/:id', to: 'products#show', as: 'products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
