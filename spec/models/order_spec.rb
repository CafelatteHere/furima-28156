require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, item_id: @item.id, user_id: @user.id)
      @order2 = FactoryBot.build(:order, item_id: @item.id, user_id: @user.id)
    end

  it "userが紐付いていないと購入できないこと" do
    @order.user_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User must exist")
  end

  it "itemが紐付いていないと購入できないこと" do
    @order.item_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Item must exist")
  end


  it "購入した商品は、再度購入できない状態になっている" do
    allow(@order2).to receive(:save!).and_raise(ActiveRecord::RecordNotUnique)
    @order.save
    @order2.item_id = @order.item_id
    expect{@order2.save validate: false}.to raise_error(ActiveRecord::RecordNotUnique)
  end
  end
end
