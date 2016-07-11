Rails.application.routes.draw do
  root 'home#index'

  resources :sessions, only: [:create]
  resources :users, only: [:show, :new, :create]
  resources :deals, only: [:index]
end
