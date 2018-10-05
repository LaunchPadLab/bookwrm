Rails.application.routes.draw do
  root to: 'books#index'

  devise_for :users
  resources :authors
  resources :books do
    resources :reviews
    resources :favorites
  end
  resources :users
end
