Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  resources :details
  # get '/products/:id', to: 'products#show', as: 'products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
