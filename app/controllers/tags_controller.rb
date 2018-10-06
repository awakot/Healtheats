class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end
  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @tag, notice: 'タグが更新されました。' }
      else
        format.html { render :edit}
      end
    end
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'タグが削除されました。' }
    end
  end

 private
  def set_tag
    @tag = Tag.find(params[:id])
  end


end
