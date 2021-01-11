class BuysController < ApplicationController

  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy_address = BuyAddress.new(address_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def address_params
    params.require(:buy_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone).merge(user_id: current_user.id,item_id:params[:item_id])
  end
end
