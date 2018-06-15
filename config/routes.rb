Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_up: 'users/sign_up'}

  get 'teams/sign_up' => 'teams#new', as: 'new_team'
  get 'teams/:id/users' => 'teams#users_index'

  get 'teams/:id/projects/new' => 'projects#new', as: 'new_project'
  post 'teams/:id/projects' => 'projects#create', as: 'projects'

  root 'static#index', as: 'root'

  resources :tasks
  resources :projects, except: [:new, :create]
 
  resources :users, only: [:show]
  resources :teams, except: [:new]
 
end
