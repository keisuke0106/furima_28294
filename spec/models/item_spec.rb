require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品登録がうまくいくとき' do
      it 'image, name, explanation, category_id, condition_id, postage_type_id, preparation_day_id, shipping_region_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explanationが空だと登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it 'condition_idが空だと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end

      it 'postage_type_idが空だと登録できない' do
        @item.postage_type_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage type can't be blank", 'Postage type is not a number')
      end

      it 'preparation_day_idが空だと登録できない' do
        @item.preparation_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation day can't be blank", 'Preparation day is not a number')
      end

      it 'shipping_region_idが空だと登録できない' do
        @item.shipping_region_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region can't be blank", 'Shipping region is not a number')
      end

      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it 'priceが300未満だと登録できない' do
        @item.price = '290'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9999999以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
