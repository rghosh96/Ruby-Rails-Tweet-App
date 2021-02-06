Rails.application.routes.draw do
  # GET /about ; looks for about_controller in controllers
  # specify as so all paths referring to this knows!
  get "about_me", to: "about#index", as: :about

  # sign up page
  get "sign_up", to: "registrations#new"
  # to create user
  post "sign_up", to:"registrations#create"
  # log into user via sessions; get for form, post for form submission
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # logout user by destroying session
  delete "logout", to:"sessions#destroy"

  # updating password
  get "password", to: "passwords#edit"
  # patch so we can update it for the user
  patch "password", to: "passwords#update"

  # resetting password
  get "password/reset", to: "password_resets#new"
  # sends out email
  post "password/reset", to: "password_resets#create"
  # to actually perform the reset
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  # for twitter auth
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  # need to define route route! same as get "/" or ""
  root to: "main#index"
end
