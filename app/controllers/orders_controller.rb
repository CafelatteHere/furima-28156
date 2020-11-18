class OrdersController < ApplicationController
  before_action :define_item, only: %i[index create redirect]
  before_action :move_to_signin
  before_action :redirect

  def index
    # @item = Item.find(params[:item_id])
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def define_item
    @item = Item.find(params[:item_id])
  end

  def move_to_signin
    redirect_to user_session_path unless user_signed_in?
  end

  def redirect
    if @item.user_id == current_user.id || @item.order
      redirect_to item_path(@item.id)
    end
  end

end
