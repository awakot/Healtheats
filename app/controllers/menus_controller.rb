class MenusController < ApplicationController
  def show
    @menu = Menu.find(params[:id])
    @calorie = Calorie.find(@menu.calorie_id).amount
    @restaurant = Restaurant.find(@menu.restaurant_id)
    @activity = UserMenu.new
  end
end
