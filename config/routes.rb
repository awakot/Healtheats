Rails.application.routes.draw do
  root to: 'categories#index'

  namespace :api do
    resources :menus, only: [:index, :create, :delete]
    resources :restaurants, only: :index
    resources :calories, only: [:index, :show]
    resources :image_uploaders, only: :create
  end

  namespace :admin do
    root to: 'menus#index'
    resources :menus, only: :index
    resources :restaurants, only: :index
    resources :categories
    resources :tags
  end

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :categories, only: :index
  resources :menus, only: :show
  resources :restaurants, only: :show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
