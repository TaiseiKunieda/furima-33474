require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "商品を出品できる時" do
      it "全ての情報があれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品を出品できない時" do
      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "category_idが空だと出品できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "state_idが空だと出品できない" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it "postage_idが空だと出品できない" do
        @item.postage_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it "area_idが空だと出品できない" do
        @item.area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it "days_to_shipが空だと出品できない" do
        @item.days_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end

      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角数字だと出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300円未満だと出品できない" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが10000000円以上だと出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end


