Rails.application.routes.draw do
  get '/manage_user', to: "admin_panel#manage_user"
  get '/manage_organization', to: "super_panel#manage_organization"
  get '/manage_case', to: "admin_panel#manage_case"
  get '/invite_user', to: "admin_panel#invite_user"

  devise_for :users, :skip => [:registrations] , controllers: {
    sessions: 'users/sessions'
  }




  # devise_for :users, controllers: {
  #   :sessions => "users/sessions",
  #   :registrations => "users/registrations" }

  resources :cases
  resources :organizations
  resources :super_panel
  resources :admin_panel
 # get 'super_panel/index', to: 'super_panel#index',  as: :yabloi

  root 'cases#index'
end
