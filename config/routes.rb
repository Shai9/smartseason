Rails.application.routes.draw do
  # Authentication routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # Root path
  root "sessions#new"
  
  # Admin routes
  namespace :admin do
    get "dashboard", to: "dashboard#index"
  end
  
  # Agent routes
  namespace :agent do
    get "dashboard", to: "dashboard#index"
  end
  
  # Field and Update routes
  resources :fields do
    resources :updates, only: [:new, :create]
  end
end
