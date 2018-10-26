class Api::RestaurantsController < ApplicationController
  def index
    @data = Restaurant.all.order("id DESC")
  end
end
