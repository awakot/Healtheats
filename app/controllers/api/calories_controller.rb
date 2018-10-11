class Api::CaloriesController < ApplicationController
  protect_from_forgery :except => ["create"] # TODO: あとで消したい

  def index
    @data = Calorie.all
  end

  def create
    @calorie = Calorie.create(menu_params)
    render :index, status: :created
  end

  def show
    @data = Calorie.find(params[:id])
  end

  private

  def menu_params
    params.permit(:amount)
  end
end
