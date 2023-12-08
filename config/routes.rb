Rails.application.routes.draw do
  get 'dashboard', to: 'pages#dashboard'

  resources :gemfiles

  # Authentication
  get 'auth/github/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  delete 'sign_out', to: 'sessions#destroy'
  get 'login', to: redirect('/auth/github'), as: 'login'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "gemfiles#index"
end
