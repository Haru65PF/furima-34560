require 'rails_helper'

RSpec.describe ItemrecordAddress, type: :model do
  describe '商品購入' do
    before do
      @itemrecord_address = FactoryBot.build(:itemrecord_address)
      sleep(1)
    end

    context '商品購入できるとき' do
      it '全ての情報が揃っていれば登録できる' do
        expect(@itemrecord_address).to be_valid
      end

      it '配送先の建物が空でも登録できる' do
        @itemrecord_address.building = ''
        expect(@itemrecord_address).to be_valid
      end
    end

    context '商品購入できない時' do
      it 'post_numが空の時は無効' do
        @itemrecord_address.post_num = ''
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Post num can't be blank")
      end
      it 'post_numが1234-567の時は無効' do
        @itemrecord_address.post_num = '1234-567'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Post num is invalid")
      end

      it 'post_numが1234-5678の時は無効' do
        @itemrecord_address.post_num = '1234-5678'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Post num is invalid")
 
      end

      it 'post_numが123-567の時は無効' do
        @itemrecord_address.post_num = '123-567'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Post num is invalid")
 
      end

      it 'post_numにハイフンがない時は無効' do
        @itemrecord_address.post_num = '1235678'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Post num is invalid")
 
      end

      it 'post_numが全角の時は無効' do
        @itemrecord_address.post_num = '1234-5678'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Post num is invalid")
 
      end

      it 'prefecture_idが１の時は無効' do
        @itemrecord_address.prefecture_id = 1
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Prefecture must be other than 1")

      end

      it 'cityが空の時は無効' do
        @itemrecord_address.city = ''
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空の時は無効' do
        @itemrecord_address.address = ''
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空の時は無効' do
        @itemrecord_address.phone = ''
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Phone can't be blank")

      end

      it 'phoneが全角の時は無効' do
        @itemrecord_address.phone = '０００００００００００'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Phone is invalid")

      end

      it 'phoneが12桁以上の時は無効' do
        @itemrecord_address.phone = '090000000000'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneは英数混合の時は無効' do
        @itemrecord_address.phone = '090abss0000'
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Phone is invalid")
      end

      it 'tokenが空の時は無効' do
        @itemrecord_address.token = ''
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空の時は無効' do
        @itemrecord_address.user_id = nil
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空の時は無効' do
        @itemrecord_address.item_id = nil
        @itemrecord_address.valid?
        expect(@itemrecord_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end