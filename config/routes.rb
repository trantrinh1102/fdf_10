Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  namespace :admin do
    root "users#index"
    resources :categories
    resources :products
  end
end
