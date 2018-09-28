class Api::MenusController < ApplicationController
  def index
    # GET /api/menus.json で仮のJSONを返す
    # TODO: DBから値取得
    @data = [
      { "name": "さらだ", "description": "おいしいさらだ", "price": 1200, "kcalorie": 298 },
      { "name": "にく", "description": "おいしいにく", "price": 1320, "kcalorie": 430 },
    ]
  end

  def create
    # @menu = Menu.create(menu_params)
    # TODO: commit data
    render :show, status: :created
  end

  private

  def menu_params
    params.permit(:name, :description, :price, :kcalorie)
  end
end
