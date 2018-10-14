class Api::MenusController < ApplicationController
  protect_from_forgery :except => ["create"] # TODO: あとで消したい

  def index
    @data = Menu.all.order("id DESC")
  end

  def create
    @menu = Menu.create(menu_params)
    render :index, status: :created
  end

  # メニューの更新のAPIは大変そうなので保留
  # def update
  # end

  def delete
    menu = Menu.find(params[:id])
    menu.destroy
    render :index, status: :deleted
  end

  private

  def menu_params
    params.permit(:name, :description, :price, :calorie_id, :picture)
  end
end
