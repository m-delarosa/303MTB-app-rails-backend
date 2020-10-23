Rails.application.routes.draw do
  resources :user_trails, only: [:index, :create, :destroy]
  resources :trails, only: [:index, :show, :update]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  
  resources :users do
    member do
      get :confirm_email
    end
  end
  
  post "/login", to: "authentication#login"

end
