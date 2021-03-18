class ItemrecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :itemrecord_search, only: [:index, :create]

  def index
    @itemrecord_address = ItemrecordAddress.new
  end

  def create
    @itemrecord_address = ItemrecordAddress.new(params_buy)
    if @itemrecord_address.valid?
      pay_item
      @itemrecord_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def params_buy
    params.require(:itemrecord_address).permit(:post_num, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params_buy[:token],
      currency: 'jpy'
    )
  end

  def itemrecord_search
    redirect_to root_path if current_user.id == @item.user_id || @item.itemrecord.nil?
  end

end
