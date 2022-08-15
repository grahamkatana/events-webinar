Rails.application.routes.draw do
  devise_for :admin_users,  controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords'
  }
  root 'home#index'
  resources :workshops, only: %i[index show]
  resources :bookings, only: %i[create] do
    get :booking_details, on: :member
  end


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :webinars, only: [:index]
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
