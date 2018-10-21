class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def new
    @category = Category.new
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, notice: 'カテゴリーが更新されました。' }
      else
        format.html { render :edit}
      end
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'カテゴリーが削除されました。' }
    end
  end

private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
