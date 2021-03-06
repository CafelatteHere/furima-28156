class OrdersController < ApplicationController
  before_action :define_item, only: %i[index create redirect]
  before_action :authenticate_user!
  before_action :redirect

  def index
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      pay_item
      @order_shipment.save

      redirect_to root_path, notice: 'Order successful!'
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:order_shipment).permit(:prefecture_id, :zip_code, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def define_item
    @item = Item.find(params[:item_id])
  end

  def redirect
    redirect_to item_path(@item.id) if @item.user_id == current_user.id || @item.order
  end
end
