require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "登録ができる時" do
      it "全ての情報があれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "登録ができる時" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていなければ登録できないこと" do
        @user.email = "test.example"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordと確認が一致していないと登録できない" do
        @user.password = "111aaa"
        @user.password_confirmation = "111bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが全て半角英字の時登録できない" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it "passwordが全て半角数字の時登録できない" do
        @user.password = "111111"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it "passwordが6文字以上の全角英数字の時登録できない" do
        @user.password = "１１１ａａａ"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it "first_name_Jが空では登録できない" do
        @user.first_name_J = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name j can't be blank")
      end

      it "last_name_Jが空では登録できない" do
        @user.last_name_J = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name j can't be blank")
      end

      it "first_name_Jが全角入力でなければ登録できない" do
        @user.first_name_J = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name j is invalid")
      end

      it "last_name_Jが全角入力でなければ登録できない" do
        @user.last_name_J = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name j is invalid")
      end

      it "first_name_Kが空では登録できない" do
        @user.first_name_K = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end

      it "last_name_Kが空では登録できない" do
        @user.last_name_K = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k can't be blank")
      end

      it "first_name_Kが全角カタカナでなければ登録できないこと" do
        @user.first_name_K = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k is invalid")
      end

      it "last_name_kanaが全角カタカナでなければ登録できないこと" do
        @user.last_name_K = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k is invalid")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
