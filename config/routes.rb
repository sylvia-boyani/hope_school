Rails.application.routes.draw do
  # 1. Devise Routes
  devise_for :users
  # Moving this here and ensuring we handle the "skip" properly in the views
  devise_for :admins, skip: [:registrations]

  # 2. Admin Namespace
  namespace :admin do
    root "dashboard#index" # This sets admin_root_path
    get "dashboard", to: "dashboard#index"

    # resources already creates index, new, edit, show, create, update, destroy
    resources :students
    resources :teachers
    resources :levels
    resources :class_rooms
    resources :subjects
    resources :admissions
  end

  # 3. Public Pages
  root "home#index"
  get "home/index"
  get "/about", to: "home#about"
  get "/programs", to: "home#programs"
  get "/admissions", to: "home#admissions"
  get "contact", to: "home#contact"
  post "contact", to: "home#create_inquiry"

  get "up" => "rails/health#show", as: :rails_health_check
end