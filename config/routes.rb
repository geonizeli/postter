Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :create]
  resources :user_follows, only: [:create, :destroy]
  resources :users, only: [:show]
end
