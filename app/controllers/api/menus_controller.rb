class Api::MenusController < ApplicationController
  def index
    # /api/menus.json で仮のJSONを返す
    # TODO: DBから値取得
    @menus = [
      { "name": "さらだ", "description": "おいしいさらだ", "price": 1200, "kcalorie": 298 },
      { "name": "にく", "description": "おいしいにく", "price": 1320, "kcalorie": 430 },
    ]
  end
end
