Rails.application.routes.draw do
  resources :projects
  resources :tasks
  root 'static#index', as: 'root'
  devise_for :users 
  resources :users, only: [:show]
  resources :teams

  post 'tasks/:id' => 'tasks#complete'
 
end
