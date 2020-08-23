require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "name、description、category_id、status_id、shipping_fee_id、shipping_origin_id、shipping_days_id、price、image（png形式）が存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "imageがjpg形式の場合、登録できる" do
        @item.image = fixture_file_upload('public/images/test_image.jpg')
        expect(@item).to be_valid
      end
      it "imageがgif形式の場合、登録できる" do
        @item.image = fixture_file_upload('public/images/test_image.gif')
        expect(@item).to be_valid
      end
    end

    context "商品の出品ができない場合" do
      it "imageが空の場合登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空の場合登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "nameが改行を含む場合登録できない" do
        @item.name = "アイテムの\n名前-sample123/"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is invalid")
      end

      it "descriptionが空の場合登録できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空の場合登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "statusが空の場合登録できない" do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "shipping_fee_idが空の場合登録できない" do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it "shipping_origin_idが空の場合登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "shipping_days_idが空の場合登録できない" do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      
      it "priceが空の場合登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it "priceが300円未満の場合登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it "priceが10,000,000円以上の場合登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price out of setting range")
      end

      it "priceが全角の場合登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price positive number and half-width characters only")
      end

      it "priceが数字以外の場合登録できない" do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price positive number and half-width characters only")
      end
    end
  end
end