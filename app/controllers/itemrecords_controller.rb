class ItemrecordsController < ApplicationController
  def index
    @itemrecord_address = ItemrecordAddress.new
  end

  def create
    @itemrecord_address = ItemrecordAddress.new(params_buy)
    if @itemrecord_address.valid?
      @itemrecord_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def params_buy
    params.require(:itemrecord_address).permit(:post_num, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
