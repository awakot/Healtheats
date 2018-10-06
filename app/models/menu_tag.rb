class MenuTag < ApplicationRecord
  has_many :menus
  belongs_to :tag
end
