class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    validates :image
    validates :name, format: { with: /\A.+\z/ } 
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price, numericality: { only_integer: true, message: "is positive number and half-width characters only" }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
end
