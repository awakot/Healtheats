class ActivitiesController < ApplicationController
  def create
    menu_id = params[:menu][:id]
    user_id = current_user.id
    UserMenu.create(menu_id: menu_id, user_id: user_id)
    render :thanks
  end

  def index
    @menu_ids_with_date = {}
    UserMenu.all
            .where(user_id: current_user.id)
            .map{ |user_menu| @menu_ids_with_date[user_menu.menu_id] = user_menu.created_at }

    @menus = Menu.all.where(id: @menu_ids_with_date.keys.to_a)
  end

  def thanks
  end
end
