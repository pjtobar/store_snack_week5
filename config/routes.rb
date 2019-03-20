Rails.application.routes.draw do
  root 'products#index'
  get 'comments/index'
  get 'comments/new'
  devise_for :users
  resources :users do
    resources :comments
  end
  resources :products do
    resources :comments
  end
  resources :details
  resources :likes
  get "details/pay/:id", to: 'details#pay', as: 'pay'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :products
      resources :sessions
      resources :users
    end
  end
  # get '/products/:id', to: 'products#show', as: 'products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
