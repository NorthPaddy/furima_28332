Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
  root to: "home#index"
  resources :items, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :orders, only: [:create]
  resources :address
end
