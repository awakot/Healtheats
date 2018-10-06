class MenuRestaurant < ApplicationRecord
  belongs_to :menu
  belongs_to :restaurant
  validates :menu_id, presence: true
  validates :restaurant_id, presence: true
end
