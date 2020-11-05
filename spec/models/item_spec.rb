require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end

    it "必須項目を全て入力し商品出品することができる" do
      expect(@item).to be_valid
    end
    it "画像が空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descriptionが空だと登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが1だと登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "condition_idが1だと登録できない" do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "shipment_type_idが1だと登録できない" do
      @item.shipment_type_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment type must be other than 1")
    end
    it "area_idが1だと登録できない" do
      @item.area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "days_to_ship_idが1だと登録できない" do
      @item.days_to_ship_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300 & 9999999")
    end
    it "priceが300以下だと登録できない" do
      @item.price = "23"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300 & 9999999")
    end
    it "priceが9.999.999以上だと登録できない" do
      @item.price = "999999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300 & 9999999")
    end
    it "priceが文字だと登録できない" do
      @item.price = "abc"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300 & 9999999")
    end
    it "priceが全角だと登録できない" do
      @item.price = "４０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be between 300 & 9999999")
    end
  end
end
