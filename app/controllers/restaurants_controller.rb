class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # @restaurants = Restaurant.all
  end

  def show
  end

  def new
    # @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    # @restaurant = Restaurant.new(restaurant_params)

    # respond_to do |format|
    #   if @restaurant.save
    #     format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
    #   else
    #     format.html { render :new }
    #   end
    # end
  end

  def update
    # respond_to do |format|
    #   if @restaurant.update(restaurant_params)
    #     format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
    #   else
    #     format.html { render :edit }
    #   end
    # end
  end

  def destroy
    # @restaurant.destroy
    # respond_to do |format|
    #   format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
    # end
  end

  private
    # TODO: model出来次第埋める
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # TODO: model出来次第埋める
    def restaurant_params
      params.fetch(:restaurant, {})
    end
end
