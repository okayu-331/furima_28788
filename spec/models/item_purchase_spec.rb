require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品の出品' do
    context "商品の購入ができる場合" do
      it "postal_code、prefecture_id, city, address, building, phone_number,item_id, user_id, purchase_idが存在すれば登録できる" do
        expect(@item_purchase).to be_valid
      end
      it "buildingは存在しなくても登録できる" do
        @item_purchase.building = nil
        expect(@item_purchase).to be_valid
      end
    end

    context "商品の購入ができない場合" do
      it "postal_codeが空の場合、登録できない" do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "postal_codeがハイフンを含まない場合、登録できない" do
        @item_purchase.postal_code = 1234567
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "postal_codeが全角を含む場合、登録できない" do
        @item_purchase.postal_code = "１２３-４５６７"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "prefecture_idが空の場合、登録できない" do
        @item_purchase.prefecture_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "cityが空の場合、登録できない" do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "addressが空の場合、登録できない" do
        @item_purchase.address = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "phone_numberが空の場合、登録できない" do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "phone_numberが記号を含む場合、登録できない" do
        @item_purchase.phone_number = "090-111-111"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
      it "phone_numberが全角の場合、登録できない" do
        @item_purchase.phone_number = "１２３４５６７８９０"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("is invalid")
      end
    end
  end
end


