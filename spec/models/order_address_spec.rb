require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入者の情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address, token: 'aaaaaaa')
    end

    it '全ての値が正しく入力されていれば保存できる' do
      expect(@order_address).to be_valid
    end
    it 'building_nameが空でも保存できる' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end

    it 'postal_codeが空だと保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できない' do
      @order_address.postal_code = 1_231_234
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できない' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できない' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephone_numberが空だと保存できない' do
      @order_address.telephone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'telephone_numberが11桁以上だと保存できない' do
      @order_address.telephone_number = '000123412345'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Telephone number is out of setting range')
    end
    it 'telephone_numberが11桁以下だと保存できない' do
      @order_address.telephone_number = '0001234123'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Telephone number is out of setting range')
    end
  end
end
