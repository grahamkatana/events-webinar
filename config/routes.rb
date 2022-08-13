Rails.application.routes.draw do
  root 'home#index'
  resources :workshops, only: %i[index show]
  resources :bookings, only: %i[create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
