class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:product, :price, :explanation, :image, :category_id, :state_id, :postage_id, :area_id, :wait_id).merge(user_id: current_user.id)
  end
end
