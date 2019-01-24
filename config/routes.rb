Rails.application.routes.draw do
  devise_for :users
  resources :cases
  root 'cases#index'
end
