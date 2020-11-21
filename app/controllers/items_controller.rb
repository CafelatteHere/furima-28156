class ItemsController < ApplicationController
  before_action :define_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :redirect, only: %i[edit destroy]

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
    @items = Item.includes(:order, :user).order(id: 'DESC')
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipment_type_id, :area_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def define_item
    @item = Item.find(params[:id])
  end

  def redirect
    redirect_to item_path(@item.id) unless @item.user == current_user
  end
end
