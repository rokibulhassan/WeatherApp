Rails.application.routes.draw do
  resources :cities
  devise_for :users
  root 'dashboard#index'
end
