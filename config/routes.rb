Rails.application.routes.draw do
  get '/manage_user', to: "super_panel#manage_user"
  get '/manage_organization', to: "super_panel#manage_organization"

  devise_for :users


  # devise_for :users, controllers: {
  #   :sessions => "users/sessions",
  #   :registrations => "users/registrations" }

  resources :cases
  resources :organizations
  resources :super_panel
 # get 'super_panel/index', to: 'super_panel#index',  as: :yabloi

  root 'cases#index'
end
