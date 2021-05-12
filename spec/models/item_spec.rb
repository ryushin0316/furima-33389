require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができる' do
      it '全ての情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'カテゴリーの情報が0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品の状態についての情報が必須であること' do
        @item.type_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Type is not a number')
      end
      it '商品の状態についての情報が0では登録できない' do
        @item.type_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Type must be other than 0')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_pay_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery pay is not a number')
      end
      it '配送料の負担についての情報が0では登録できない' do
        @item.delivery_pay_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery pay must be other than 0')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end
      it '発送元の地域についての情報が0では登録できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it '発送までの日数についての情報が必須であること' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end
      it '発送までの日数についての情報が0では登録できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が上限を超えた場合は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end
