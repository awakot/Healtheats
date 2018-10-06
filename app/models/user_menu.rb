class UserMenu < ApplicationRecord
  belongs to :user
  belongs to :menu
end
