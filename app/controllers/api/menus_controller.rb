class Api::MenusController < ApplicationController
  protect_from_forgery :except => ["create"] # TODO: あとで消したい

  def index
    @data = Menu.all
  end

  def create
    @menu = Menu.create(menu_params)
    render :index, status: :created
  end

  private

  def menu_params
    params.permit(:name, :description, :price, :calorie_id, :picture)
  end
end
