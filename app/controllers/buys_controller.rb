class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root
  before_action :move_to_out

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(address_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def address_params
    params.require(:buy_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def move_to_out
    item = Item.find(params[:item_id])
    if item.buy.id.present?
      redirect_to root_path
    end
  end
end