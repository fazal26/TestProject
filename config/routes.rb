Rails.application.routes.draw do
  resources :verifications
  get '/manage_user', to: "admin_panel#manage_user"
  get '/manage_case', to: "admin_panel#manage_case"
  get '/all_users', to:"super_panel#all_users"
  get '/case/:id/comment', to: "cases#comment", as: "add_comment"
  get '/case/:id/verification', to: "cases#verification", as: "add_verification"
  devise_for :users, controllers: { invitations: 'users/invitations' }

  resources :cases
  resources :comments
  resources :organizations
  resources :super_panel
  resources :admin_panel
  resources :users
  resources :optins

  root 'cases#index'
end
