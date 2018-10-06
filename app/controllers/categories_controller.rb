class CategoriesController < ApplicationController
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
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'カテゴリーが更新されました。' }
      enlse
        format.html { render :edit}
      end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'カテゴリーが削除されました。' }
  end

private

  def set_category
    @category = Category.find(params[:id])
  end
end
