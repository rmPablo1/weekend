Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get "/dashboard", to: "dashboards#dashboard"
  resources :events, only:[:new, :create]
  resources :friends, only: [:index, :show,:new, :create, :destroy]
  post "/friends/:id", to:"friends#accept", as: :accept_request
  post "/create-events-google", to: "pages#create_events_google"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
