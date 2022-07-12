Rails.application.routes.draw do
  resources :air_now_data
  # get 'home/index'
  root'home#index'
  get '/search',to:'home#search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
