Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root "dashboard#index"
    get "dashboard", to: "dashboard#index"

    resources :levels
    resources :subjects
    resources :class_rooms
    resources :admissions
    resources :students
    resources :teachers
  end

  devise_for :admins, skip: [ :registrations ]

  get "home/index"
  root "home#index"
  get "/about", to: "home#about"
  get "/programs", to: "home#programs"
  get "/admissions", to: "home#admissions"
  get "contact", to: "home#contact"
  post "contact", to: "home#create_inquiry"

  get "up" => "rails/health#show", as: :rails_health_checkqueries
end
