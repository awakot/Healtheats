Rails.application.routes.draw do
  namespace :api do
    get 'menus', to: 'menus#index'
    post 'menus', to: 'menus#create'
  end
  get 'menus/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
