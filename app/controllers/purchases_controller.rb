class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = ItemPurchase.new

    if @item.purchase != nil || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(
      :postal_code, :prefecture_id, :city, :address, :building,
      :phone_number, :purchase_id
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
