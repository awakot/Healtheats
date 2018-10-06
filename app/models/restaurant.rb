class Restaurant < ApplicationRecord
  has_many :menu_restaurants
  has_many :menus, through: :menu_restaurants
end
