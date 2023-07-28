Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # --------------service_routes-----------------
  resources :service
  delete "/delete/service/:id", to: "service#destroy"
  # --------------user_routes--------------------
  resource :users
  post "/auth/user/login", to: "user_authentication#login"
# -------------rating_routes-------------------
  resources :rating, only: [:create]
  
end
