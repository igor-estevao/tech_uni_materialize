Rails.application.routes.draw do
  resources :schools

  resources :courses do
    get "enroll_self", to: "courses#enroll_self", as: "enroll_self"
  end
  resources :students
  
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create", as: "create_session"
  get "logout", to: "sessions#destroy", as: "logout"


  root "courses#index"
end
