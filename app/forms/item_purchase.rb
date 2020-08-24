class ItemPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id, :user_id, :item_id

  # バリデーション

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
      building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end