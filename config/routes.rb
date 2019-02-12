Rails.application.routes.draw do
  get '/manage_user', to: "admin_panel#manage_user"
  get '/manage_organization', to: "super_panel#manage_organization"
  get '/manage_case', to: "admin_panel#manage_case"

  devise_for :users, :controllers => { invitations: 'users/invitations' }

  resources :cases
  resources :organizations
  resources :super_panel
  resources :admin_panel
  resources :users

  root 'cases#index'
end
