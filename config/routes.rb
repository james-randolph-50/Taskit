Rails.application.routes.draw do
  root 'static#index'
  devise_for :users #, controllers: {
    #sessions: 'users/sessions'
 # }
  resources :teams
  #root to: "home#index"
end
