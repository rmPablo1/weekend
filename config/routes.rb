Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  get "/dashboard", to: "dashboards#dashboard"
  resources :events, only:[:new, :create, :destroy]
  resources :friends, only: [:index, :show,:new, :create, :destroy]
  post "/friends/:id", to:"friends#accept", as: :accept_request
  post "/create-events-google", to: "pages#create_events_google"
  post "/add", to:"groups#add", as: :add_member
  delete "/remove/:id", to:"groups#remove", as: :remove_member
  resources :users_groups, only:[:destroy]
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
