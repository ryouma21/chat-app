Rails.application.routes.draw do
  get 'messages/index'
  root to: "rooms#index"
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy]do
    resources :messages, only: [:index, :create]
  end
end
