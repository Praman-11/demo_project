Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customer
  resources :admin
  post '/auth/customer/login',to: 'authentication#login'
  post '/auth/admin/login',to: 'admin_authentication#login'
  resources :service

end
