Rails.application.routes.draw do
  namespace :api do
    get 'menus/index'
  end
  namespace :api do
    resources :menus, only: :index
  end
  get 'menus/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
