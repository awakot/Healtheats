class CategoriesController < ApplicationController
  def index
    categories = Category.all
    current_location = [35.6923162, 139.7723464]

    #TODO: すごく負荷のかかるクエリを発行してしまうので修正すべき
    @json = 
      categories
      .preload(:menus)
      .map { |category| category.as_json.merge({ 
        menus: category.menus.shuffle.take(3).as_json
      })}

    # @json = 
    #   categories
    #   .preload(:menus)
    #   .map { |category| category.as_json.merge({ 
    #     menus: category.menus
    #            .map{ |menu|
    #              restaurant = Restaurant.find(menu.restaurant_id)
    #              lat = restaurant.latitude
    #              lon = restaurant.longitude
    #              restaurant_location = [lat, lon]
    #              return menu if Geocoder::Calculations.distance_between(current_location, restaurant_location) <= 1
    #            }.shuffle.take(3).as_json
    #   })}
  end
end
