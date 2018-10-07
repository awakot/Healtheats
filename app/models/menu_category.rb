class MenuCategory < ApplicationRecord
  belongs_to :category
  belongs_to :menu
  validates :category_id, presence: true
  validates :menu_id, presence: true
end
