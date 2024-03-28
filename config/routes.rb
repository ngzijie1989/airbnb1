Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :listings do
    resources :bookings, only: %i[create new]
    
    get "/addfavorites", to: "listings#addfavorites", as: "add_favorites"
  end

  resources :bookings, only: %i[index show] do
    get "/listings/:id", to: "listings#bookedlistingshow", as: "view_listing"
    get "/sendreminder", to: "bookings#sendreminder", as: "sendreminder"
  end

  get "/account_info", to: "pages#account_info", as: "account_info"
  
  resources :favorites, only: %i[index]
end
