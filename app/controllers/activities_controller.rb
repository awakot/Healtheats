class ActivitiesController < ApplicationController
  def create
    menu_id = params[:menu][:id]
    user_id = current_user.id
    UserMenu.create(menu_id: menu_id, user_id: user_id)
    render :thanks
  end

  def index
  end

  def thanks
  end
end
