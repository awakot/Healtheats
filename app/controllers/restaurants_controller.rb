class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = Menu.find(@restaurant.menu_ids)
  end
end
