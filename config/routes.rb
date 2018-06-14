Rails.application.routes.draw do

  devise_for :users, path: ''

  root 'static#index', as: 'root'

  resources :projects
  resources :tasks
 
  resources :users, only: [:show]
  resources :teams

  get 'teams/:id/users' => 'teams#users_index'
 
end
