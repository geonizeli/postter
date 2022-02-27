Rails.application.routes.draw do
  resources :user_follows, only: [:create, :destroy]
  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
