require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
  end

  describe "商品購入" do
    context '商品購入できるとき' do
      it "postal_code、area_id、city、house_number、building_name、phone、associationが存在すれば登録できる" do
        expect(@buy_address).to be_valid
      end
      it "building_nameが空でも購入できる" do
        @buy_address.building_name = ""
        expect(@buy_address).to be_valid
      end
    end
    
    context '商品購入できないとき' do
      it "postal_codeが空だと購入できない" do
        @buy_address.postal_code = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it "postal_codeに-が無いと購入できない" do
        @buy_address.postal_code = "1111111"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Postal code is invalid"
      end
      it "postal_codeが全角だと購入できない" do
        @buy_address.postal_code = "１１１−１１１１"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Postal code is invalid"
      end
      it "area_idが空だと購入できない" do
        @buy_address.area_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Area can't be blank"
      end
      it "area_idが1だと購入できない" do
        @buy_address.area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Area must be other than 1"
      end
      it "cityが空だと購入できない" do
        @buy_address.city = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "City can't be blank"
      end
      it "house_numberが空だと購入できない" do
        @buy_address.house_number = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "House number can't be blank"
      end
      it "phoneが空だと購入できない" do
        @buy_address.phone = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone can't be blank"
      end
      it "phoneに-があると購入できない" do
        @buy_address.phone = "080-1234-5678"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone is too long (maximum is 11 characters)"
      end
      it "phoneが12桁以上あると購入できない" do
        @buy_address.phone = "080123456789"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone is too long (maximum is 11 characters)"
      end
      it "phoneが全角だと購入できない" do
        @buy_address.phone = "０８０１２３４５６７８"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include "Phone is invalid"
      end
    end
  end
end
