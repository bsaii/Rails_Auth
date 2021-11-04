Rails.application.routes.draw do
  #GET /about
  get "about", to: "about#index" #the about controller with index action

  #GET / :main
  root to: "main#index"
  # get "/", to: "main#index" #the main/home controller with the index action

  #For sign up page
  get "sign_up", to: "registrations#new"

  #For creating a user
  post "sign_up", to: "registrations#create"

  #For logging out a user
  delete 'logout', to: "sessions#destroy"

  #For the sign in page
  get 'sign_in', to: "sessions#new"

  #For the user to sign in
  post "sign_in", to: 'sessions#create'

  #For password edit
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  #For Forgot Password
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  #For From email
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  #For omniauth callback
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"


  #To manage twitter account[s]
  #resources performs CRUD routes
  resources :twitter_accounts
  resources :tweets
 



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
