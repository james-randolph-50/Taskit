Rails.application.routes.draw do

  get 'sessions/create'

  devise_for :users, path: '', path_names: { sign_up: 'users/sign_up'}


  get 'teams/sign_up' => 'teams#new', as: 'new_team'
  get 'teams/:id/users' => 'teams#users_index'
  get 'teams/:team_id/users/:id/complete' => 'users#show_complete', as: 'user_complete'

  get 'projects/:id/tasks', to: 'projects#tasks_index'
  get 'projects/:id/tasks/:id', to: 'projects#task'

  get 'teams/:id/projects/new' => 'projects#new', as: 'new_project'
  post 'teams/:id/projects' => 'projects#create', as: 'projects'

  root 'static#index', as: 'root'

  get '/auth/twitter/callback' => 'sessions#create'

 resources :tasks do 
  member do
    get :toggle_status
  end
end

  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end
  resources :users, only: [:show]
  resources :teams, except: [:new]

 
end
