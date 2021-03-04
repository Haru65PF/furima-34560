require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    #context '新規登録できる時'
      it 'nickname,email,password,名前,ふりがな,生年月日が全て揃っていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字６文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    #end

    #context '新規登録できない時'
      it "nicknameが空の時は無効" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空の時は無効" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "同じemailが存在している時は無効" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')

      end

      it "emailのなかに＠が存在しない時は無効" do
        @user.email = 'test.sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空の時は無効" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空の時は無効" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが半角英字だけの時は無効" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordが半角数字だけの時は無効" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordとpassword_confirmationが異なる時は無効" do
        @user.password = 'aaa000'
        @user.password_confirmation = '000aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "last_nameが空の時は無効" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空の時は無効" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "base_last_nameが空の時は無効" do
        @user.base_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Base last name can't be blank")
      end

      it "base_first_nameが空の時は無効" do
        @user.base_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Base first name can't be blank")
      end

      it "birth_dateが空の時は無効" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    #end
  end
end
