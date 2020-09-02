require 'rails_helper'

describe Purchase do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@purchase).to be_valid
      end
      it 'building_nameが空でも購入できること' do
        @purchase.building_name = nil
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_codeが空だと購入できない' do
        @purchase.post_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end

      it 'post_codeがpostal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'shipping_region_idが空だと購入できないこと' do
        @purchase.shipping_region_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Shipping region can't be blank", "Shipping region is not a number")
      end

      it 'cityが空だと購入できないこと' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと購入できないこと' do
        @purchase.house_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空だと購入できないこと' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberがハイフンを含むと購入できないこと' do
        @purchase.phone_number = "090-1234-5678"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが9桁以下だと購入できないこと' do
        @purchase.phone_number = "090123456"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁以上だと購入できないこと' do
        @purchase.phone_number = "090123456789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと購入できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
