Rails.application.routes.draw do
  post 'feedbacks/create'
  root 'products#index'
  get 'comments/index'
  get 'comments/new'
  devise_for :users
  resources :users do
    resources :comments
    collection do
      get :pending_approval
      get '/approve/:id', to: 'users#approve', as: 'approve'
      get '/refuse/:id', to: 'users#refuse', as: 'refuse'
    end
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
