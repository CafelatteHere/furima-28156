class ItemsController < ApplicationController
  before_action :move_to_signin, except: [:index, :show]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipment_type_id, :area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signin
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
