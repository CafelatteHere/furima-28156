class ItemsController < ApplicationController
  before_action :move_to_signin, except: %i[index show]
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

  def index
    @items = Item.all.order( id: "DESC" )
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipment_type_id, :area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signin
    redirect_to user_session_path unless user_signed_in?
  end
end
