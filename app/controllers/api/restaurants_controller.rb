class Api::RestaurantsController < ApplicationController
  def index
      # /api/restaurants.json で仮のJSONを返す
    # TODO: DBから値取得
    @data = [
      { "name": "サパテロ", "zip_code": 1500002, "address": "ほげほげ" },
      { "name": "吉野家", "zip_code": 1500002, "address": "ふがふが" },
    ]
  end
end
