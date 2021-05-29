require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe '商品購入' do
    context '商品購入が失敗する時' do
      it 'postal_codeが空だと登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeがハイフンなしの記述だと登録できない' do
        @order_address.postal_code = '9999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが0だと登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'manicipalityが空だと登録できない' do
        @order_address.manicipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Manicipality can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと登録できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end
      it 'phoneにハイフンを記載すると登録できない' do
        @order_address.phone = '999-999-999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが11桁以上だと登録できない' do
        @order_address.phone = '999999999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
    context '商品購入が成功する時' do
      it '全ての情報を正しく入力すれば新規登録が完了する' do
        expect(@order_address).to be_valid
      end
    end
  end
end
