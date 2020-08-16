class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ンヴー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ンヴー]+\z/ }
  validates :birthday, presence: true
end