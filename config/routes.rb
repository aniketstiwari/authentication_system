Rails.application.routes.draw do
  root 'articles#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end
