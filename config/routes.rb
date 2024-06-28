Rails.application.routes.draw do
  resources :profiles
  get 'home' => 'home#index'

  controller :register do
    get  'register' => :new
    post 'register' => :create
  end
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :apartments do
    member do
      patch 'occupy'
      patch 'vacate'
    end
    resources :apartment_requests, only: [:create, :update, :destroy]
  end
  resources :cities do
    resources :neighborhoods
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

end
