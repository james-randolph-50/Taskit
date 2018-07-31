Rails.application.routes.draw do

  get 'sessions/create'

  devise_for :users, path: '', path_names: { sign_up: 'users/sign_up'}


  get 'teams/sign_up' => 'teams#new', as: 'new_team'
  get 'teams/:id/users/:user_id' => 'teams#users_index'
  get 'teams/:team_id/users/:id/complete' => 'users#show_complete', as: 'user_complete'
  get 'teams/:id/projects/new' => 'projects#new', as: 'new_project'
  post 'teams/:id/projects' => 'projects#create', as: 'projects'
  
  
  get 'projects/:id/tasks', to: 'projects#tasks_index'
  get 'projects/:id/tasks/:id', to: 'tasks#show'

  get 'projects/completed', to: 'projects#completed'


  root 'static#index', as: 'root'

  get '/auth/twitter/callback' => 'sessions#create'


  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
    member do
      get :toggle_status
    end
  end
  
  resources :users, only: [:show]
  resources :teams, except: [:new]

 
end
