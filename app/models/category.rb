class Category < ApplicationRecord
  has_many :menu_categories
  has_many :menus, through: :menu_categories
end
