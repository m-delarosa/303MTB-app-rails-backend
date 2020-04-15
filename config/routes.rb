Rails.application.routes.draw do
  resources :user_trails, only: [:index, :create, :destroy]
  resources :trails, only: [:index]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  post "/login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
