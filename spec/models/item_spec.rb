require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品情報" do
    context '商品出品できるとき' do
      it "user_id、image、product、price、explanation、category_id、state_id、postage_id、area_id、wait_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "productが空だと登録できない" do
        @item.product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Product can't be blank"
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "state_idが1だと登録できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "State must be other than 1"
      end
      it "postage_idが1だと登録できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage must be other than 1"
      end
      it "area_idが1だと登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it "wait_idが1だと登録できない" do
        @item.wait_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Wait must be other than 1"
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "priceが全角だと登録できない" do
        @item.price = "９９９"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが半角英字だと登録できない" do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが半角英数字混合だと登録できない" do
        @item.price = "aaaa999"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
