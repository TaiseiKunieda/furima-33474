require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form, user_id: @user.id, item_id: @item.id)
    sleep(0.5)
  end

  describe "商品購入" do
    context "商品購入できる時" do
      it "全ての情報があれば購入できる" do
        expect(@form).to be_valid
      end

      it "建物名が空でも購入できること" do
        @form.building_name = ""
        expect(@form).to be_valid
      end
    end
  
    context "商品を購入できない時" do
      it "郵便番号がなければ購入できない" do
        @form.postal_code = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end

      it "郵便番号にハイフンがないと購入できない" do
        @form.postal_code = "1234567"
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code is invalid")
      end

      it "都道府県がなければ購入できない" do
        @form.area_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include("Area must be other than 1")
      end

      it "市区町村がなければ購入できない" do
        @form.municipalities = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipalities can't be blank")
      end

      it "番地がなければ購入できない" do
        @form.address = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号がなければ購入できない" do
        @form.phone_number = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号が11桁以内でなければ購入できない" do
        @form.phone_number = "090123456789"
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が英数混合では購入できない" do
        @form.phone_number = "090abcdefghi"
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では購入できないこと" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できないこと" do
        @form.user_id = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では購入できないこと" do
        @form.item_id = ""
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
