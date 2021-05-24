require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end
  # :postal_code, :prefecture_id, :manicipality, :address, :building, :phone, :item_id, :user_id, :order_id
  describe '商品購入' do
    context '商品購入が失敗する時' do
      it 'postal_codeが空だと登録できない' do
        @address.postal_code = 999999
        # binding.pry
        @address.valid?
        expect(@address.errors.full_messages).to include("Product can't be blank")
      end
    #   it 'imageが空では登録できない' do
    #     @item.image = nil
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include("Image can't be blank")
    #   end
    #   it 'textが空では登録できない' do
    #     @item.text = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include("Text can't be blank")
    #   end
    #   it 'category_idが1では登録できない' do
    #     @item.category_id = 1
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Category must be other than 1')
    #   end
    #   it 'status_idが1では登録できない' do
    #     @item.status_id = 1
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Status must be other than 1')
    #   end
    #   it 'charge_idが1では登録できない' do
    #     @item.charge_id = 1
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Charge must be other than 1')
    #   end
    #   it 'prefecture_idが1では登録できない' do
    #     @item.prefecture_id = 1
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    #   end
    #   it 'priceが空欄では登録できない' do
    #     @item.price = nil
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not included in the list',
    #                                                   'Price is invalid')
    #   end
    #   it 'priceが¥100未満では登録できない' do
    #     @item.price = 99
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Price is not included in the list')
    #   end
    #   it 'priceが¥10,000,000以上では登録できない' do
    #     @item.price = 20_000_000
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Price is not included in the list')
    #   end
    #   it 'priceが全角数字では登録できない' do
    #     @item.price = '３０００'
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Price is not included in the list')
    #   end
    #   it 'priceが半角英数字混同では登録できない' do
    #     @item.price = '1a2a3'
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Price is not included in the list')
    #   end
    #   it 'priceが半角英語のみ
    #   では登録できない' do
    #     @item.price = 'aaaa'
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include('Price is not included in the list')
    #   end
    # end
    # context '商品出品が成功する時' do
    #   it '全ての情報を正しく入力すれば商品出品が完了する' do
    #     expect(@item).to be_valid
    #   end
    end
  end
end
