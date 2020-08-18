class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    with_options format: { with: /\A.+\z/ } do
      validates :name
      validates :description
    end
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_origin_id
    validates :shipping_days_id
    validates :price, numericality: { only_integer: true, message: "positive number and half-width characters only" }
    validates :image
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range"}
end
