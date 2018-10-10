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

  # メニューの更新のAPIは大変そうなので保留
  # def update
  # end

  def delete
    calorie = Calorie.find(params[:id])
    calorie.destroy
    render :index, status: :deleted
  end

  private

  def menu_params
    params.permit(:amount)
  end
end
