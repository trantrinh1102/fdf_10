Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root "static_pages#home"
  resources :static_pages
  resources :users, only: [:show]
  resources :product_suggests, only: [:new, :show, :create]
  resources :carts
  resources :products, only: [:show]
  resources :comments
  resources :orders
  namespace :admin do
    root "users#index"
    resources :categories
    resources :products
    resources :users
    resources :orders
    resources :product_suggests
  end
end
