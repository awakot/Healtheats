Rails.application.routes.draw do
  get 'tags/new'
  get 'restaurants/index'
  namespace :api, format: 'json' do
    resources :menus, only: :index # TODO: add :create
    resources :restaurants, only: :index
  end
  get 'menus/index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :tags


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
