Rails.application.routes.draw do
  devise_for :users

  resources :cities do
    get :autocomplete_city_name, :on => :collection
  end

  get 'dashboard/weather'
  root 'dashboard#index'
end
