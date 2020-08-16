require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、password、password_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空の場合、登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合、登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailが@を含まない場合、登録できない" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailが@から始まる場合、登録できない" do
      @user.email = "@aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailが@で終わる場合、登録できない" do
      @user.email = "aaaaaa@"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空の場合、登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下の場合、登録できない" do
      @user.password = "abc45"
      @user.password_confirmation = "abc45"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角英文字のみの場合、登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが半角数字のみの場合、登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが全角文字を含む場合、登録できない" do
      @user.password = "abc456あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordとpassword_confirmationが一致しない場合、登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空の場合、登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "family_nameが日本語全角以外の場合、登録できない" do
      @user.family_name = "abc456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it "first_nameが空の場合、登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameが日本語全角以外の場合、登録できない" do
      @user.first_name = "abc456"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "family_name_kanaが空の場合、登録できない" do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "family_name_kanaが半角の場合、登録できない" do
      @user.family_name_kana = "abc456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    
    it "family_name_kanaがカタカナ以外の場合、登録できない" do
      @user.family_name_kana = "たなか"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it "first_name_kanaが空の場合、登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaが半角の場合、登録できない" do
      @user.first_name_kana = "abc456"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it "first_name_kanaがカタカナ以外の場合、登録できない" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "birthdayが空の場合、登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end