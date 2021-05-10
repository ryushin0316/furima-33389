require 'rails_helper'

RSpec.describe Item, type: :model do
   before do
     @item = FactoryBot.build(:item)
   end

  describe "商品出品" do
   
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
       expect(@item.errors.full_messages).to include("Category can't be blank")
       end
       it '商品の状態についての情報が必須であること' do
       @item.type_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Type can't be blank")
       end
       it '配送料の負担についての情報が必須であること' do
       @item.delivery_pay_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Delivery pay can't be blank")
       end
       it '発送元の地域についての情報が必須であること' do
       @item.area_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Area can't be blank")
       end
       it '発送までの日数についての情報が必須であること' do
       @item.day_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Day can't be blank")
       end
       it '価格についての情報が必須であること' do
       @item.price = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Price can't be blank")
       end
       it '価格の範囲が、¥300~¥9,999,999の間であること' do
       @item.price = '100'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
       end
       it '販売価格は半角数字のみ保存可能であること' do
       @item.price = 'aaaaa'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price is not a number")
       end
     end
  end
end