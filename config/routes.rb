Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :service
  delete '/delete/service/:id', to: 'service#destroy'
  post '/auth/customer/login',to: 'customer_authentication#login'
  post '/auth/admin/login',to: 'admin_authentication#login'
  get '/services/search' ,to: 'service#show_service'
  resources :customer
  resources :admin
  resources :rating, only: [:create]
  get '/rating/search_city_wise',to: 'rating#search_city_wise'
  get '/rating/search_nearby_location', to: 'rating#search_nearby_location'
  get 'sort_listing_service_based_on_rating', to: 'rating#sort_listing_service_on_rating'
  get 'filter_services_on_rating', to: 'rating#filter_services_on_rating'
end
