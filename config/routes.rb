Rails.application.routes.draw do
  resources :user_trails, only: [:index, :create, :destroy]
  resources :trails, only: [:index, :show, :update]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  post "/login", to: "authentication#login"
end
