class CategoriesController < ApplicationController
  def index
    categories = Category.all
    @json = 
      categories
      .preload(:menus)
      .map { |category| category.as_json.merge( { menus: category.menus.shuffle.take(3).as_json }) }
  end
end
