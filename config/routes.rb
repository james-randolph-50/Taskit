Rails.application.routes.draw do

  root 'static#index', as: 'root'

  resources :projects
  resources :tasks

  devise_for :users 
  resources :users, only: [:show]
  resources :teams

  get 'teams/:id/users' => 'teams@users_index'
 
end
