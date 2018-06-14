Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_up: 'users/sign_up'}

  root 'static#index', as: 'root'

  resources :projects
  resources :tasks
 
  resources :users, only: [:show]
  resources :teams, except: [:new]

  get 'teams/sign_up' => 'teams#new', as: 'new_team'

  get 'teams/:id/users' => 'teams#users_index'
 
end
