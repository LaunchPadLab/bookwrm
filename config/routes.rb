Rails.application.routes.draw do
  root to: 'books#index'

  devise_for :users

  authenticated :user do
    root to: 'books#index', as: :authenticated_root
  end

  resources :authors
  resources :books do
    resources :reviews
    resources :favorites
  end
end
