Rails.application.routes.draw do
  root to: 'books#index'
  
  devise_for :users
  resources :authors
  resources :books
  resources :users
end
