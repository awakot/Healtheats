class MenuCategory < ApplicationRecord
    belongs_to :category
    belongs_to :menus
end
