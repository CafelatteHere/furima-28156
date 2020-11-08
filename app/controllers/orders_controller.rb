class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:id])
    @order = @item.order
  end

  def create
    @item = Item.find(params[:room_id])
    @order = @item.create_order(order_params)
    @order.save
  end

  def order_params
    params.require(:order).merge(user_id: current_user.id).merge(item_id: @item.id)
  end
end
