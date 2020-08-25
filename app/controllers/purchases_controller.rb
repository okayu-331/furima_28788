class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: :index

  def index
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    if @item.purchase != nil || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:item_purchase).permit(
      :postal_code, :prefecture_id, :city, :address, :building,
      :phone_number, :purchase_id
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],  # カードトークン
      currency:'jpy'  # 通貨の種類
    )
  end
end
