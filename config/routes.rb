Rails.application.routes.draw do
  get 'home/index'
  devise_for :profiles, controllers: {
    registrations: 'profiles/registrations'
  }
  resources :doctors, only: %i[index show]
  resources :users, only: %i[index show]
  resources :doctor_users, only: %i[create update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
end
