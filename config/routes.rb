Rails.application.routes.draw do
  resources :projects
  resources :tasks
  root 'static#index', as: 'root'
  devise_for :users #, controllers: {
    #sessions: 'users/sessions'
 # }
  resources :teams
  #root to: "home#index"
end
