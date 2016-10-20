Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :agents
  resources :messages
  devise_for :users
  root 'pages#index'
end
