require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)


      @order_shipment = FactoryBot.build(:order_shipment, item_id: @item.id, user_id: @user.id)
      @order_shipment2 = FactoryBot.build(:order_shipment, item_id: @item.id, user_id: @user.id)
    end

    it "必須項目を全て入力し商品購入することができる" do
      expect(@order_shipment).to be_valid
    end

    it "郵便番号が空と購入できない" do
      @order_shipment.zip_code = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Zip code can't be blank")
    end

    it "郵便番号にはハイフンが必要である（123-4567となる）" do
      @order_shipment.zip_code = "1234567"
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Zip code must include 7 digits and contain hyphen after 3rd digit")
    end

    it "prefecture_idがが1だと出品ができない" do
      @order_shipment.prefecture_id = 1
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "cityが空と購入できない" do
      @order_shipment.city = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("City can't be blank")
    end

    it "house_numberが空と購入できない" do
      @order_shipment.house_number = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("House number can't be blank")
    end

    it "建物名が空でも購入できる" do
      @order_shipment.building_name = nil
      @order_shipment.valid?
      expect(@order_shipment).to be_valid
    end

    it "電話番号が空と購入できない" do
      @order_shipment.tel = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Tel can't be blank")
    end

    it "電話番号は11桁以内である" do
      @order_shipment.tel = "1234567890123"
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
    end

    it "電話番号にはハイフンは不要である" do
      @order_shipment.tel = "080-1234-5678"
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Tel can include only digits")
    end


    it "tokenは空だと決済できない" do
      @order_shipment.token  = nil
      @order_shipment.valid?
      expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
    end
  end
end
