require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe '商品登録' do

    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録できるとき' do
      it '画像、商品名、商品説明、カテゴリー、状態、配送料、発送元、日数、販売価格が全て揃っていれば登録できる' do
        expect(@item).to be_valid
      end

      it '販売価格が300〜9,999,999以内であれば登録できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品登録できない時' do
      it 'imageが空の時は無効' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空の時は無効' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空の時は無効' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
 
      end

      it 'category_idが１の時は無効' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")

      end

      it 'condition_idが１の時は無効' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")

      end

      it 'delivery_pay_idが１の時は無効' do
        @item.delivery_pay_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery pay must be other than 1")

      end

      it 'prefecture_idが１の時は無効' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")

      end

      it 'delivery_date_idが１の時は無効' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")

      end

      it 'priceが空の時は無効' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300以下の時は無効' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが999999以上の時は無効' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")

      end

      it 'priceが半角英字の時は無効' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end

      it 'priceが半角数英字の時は無効' do
        @item.price = '300aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end

      it 'priceが全角の時は無効' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end

    end
  end
end
