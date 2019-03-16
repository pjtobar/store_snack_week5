Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :details
  resources :likes
  post "details/cart" => "details#cart"
  get "details/pay/:id", to: 'details#pay', as: 'pay'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :products
<<<<<<< HEAD
      resources :sessions
      resources :users
=======
>>>>>>> ddce4836d5c743255baa849a8ae36b96e8dcfe5a
    end
  end
  # get '/products/:id', to: 'products#show', as: 'products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
