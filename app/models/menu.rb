class Menu < ApplicationRecord
  has_many :user_menus
  has_many :user, through: :user_menus
  has_many :menu_categories
  has_many :categories, through: :menu_categories
  has_many :menu_tags
  has_many :tags, through: :menu_tags
  has_one :restaurant

  validates :calorie_id, presence: true

  accepts_nested_attributes_for :categories, :tags, :restaurant
end
