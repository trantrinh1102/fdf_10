Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :users, only: [:show]

  resources :products, only: [:show]
  namespace :admin do
    root "users#index"
    resources :categories
    resources :products
  end
end
