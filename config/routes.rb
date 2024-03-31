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
    
    get "/viewing", to: "listings#viewing", as: "viewing"
    get "/addfavorites", to: "listings#addfavorites", as: "add_favorites"
  end

  resources :bookings, only: %i[index show destroy] do
    get "/listings/:id", to: "listings#bookedlistingshow", as: "view_listing"
    get "/sendreminder", to: "bookings#sendreminder", as: "sendreminder"
    get "/review", to: "bookings#reviewbooking", as: "review"
    get "/approvebooking", to: "bookings#approve", as: "approve"
    get "/rejectbooking", to: "bookings#reject", as: "reject"
  end

  get "/account_info", to: "pages#account_info", as: "account_info"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  resources :favorites, only: %i[index]
end
