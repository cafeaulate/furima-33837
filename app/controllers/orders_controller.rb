class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    # binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :manicipality, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end
end
