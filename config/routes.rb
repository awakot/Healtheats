Rails.application.routes.draw do
  get 'restaurants/index'
  namespace :api, format: 'json' do
    resources :menus, only: :index
    resources :restaurants, only: :index
  end
  get 'menus/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
