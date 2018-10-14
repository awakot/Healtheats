Rails.application.routes.draw do
  get 'restaurants/index'
  namespace :api do
    resources :menus, only: [:index, :create, :delete]
    resources :restaurants, only: :index
    resources :calories, only: [:index, :show]
  end
  get 'menus/index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :categories
  resources :tags



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
