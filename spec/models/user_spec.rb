require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー情報" do
    context '新規登録できるとき' do
      it "nickname、email、password、password_confirmation、first_name、last_name、first_kana、last_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが登録済だと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "emailに@が無いと登録できない" do
        @user.email = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが全角だと登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordが半角数字のみの場合登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordが半角英字のみの場合登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it "passwordは２回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが確認用と異なると登録できない" do
        @user.password_confirmation = "11"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end

  describe "本人情報確認" do
    context '新規登録できないとき' do
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = "cc"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it "first_kanaが空だと登録できない" do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank"
      end
      it "last_kanaが空だと登録できない" do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana can't be blank"
      end
      it "first_kanaが全角（カタカナ）でないと登録できない" do
        @user.first_kana = "あ1"
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana is invalid"
      end
      it "last_kanaが全角（カタカナ）でないと登録できない" do
        @user.last_kana = "2こ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana is invalid"
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
