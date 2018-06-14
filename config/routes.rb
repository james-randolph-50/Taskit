Rails.application.routes.draw do
  root 'static#index'
  devise_for :users
  resources :teams
  #root to: "home#index"
end
