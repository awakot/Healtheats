Rails.application.routes.draw do
  get 'sessions/new'
  namespace :api do
    get 'menus', to: 'menus#index'
    post 'menus', to: 'menus#create'
  end
  get 'menus/index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
