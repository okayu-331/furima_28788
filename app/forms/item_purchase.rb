class ItemPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id, :user_id, :item_id, :token

  postal_code_regex = /\A\d{3}-\d{4}\z/
  phone_number_regex = /\d{10,11}/
  
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: postal_code_regex }
    validates :prefecture_id
    validates :city 
    validates :address 
    validates :phone_number, format: { with: phone_number_regex }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
      building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end