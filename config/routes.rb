Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root "static_pages#home"
  resources :users, only: [:show]
  resources :product_suggests, only: [:new, :show, :create]

  resources :products, only: [:show]
  resources :comments
  namespace :admin do
    root "users#index"
    resources :categories
    resources :products
    resources :users
  end
end
