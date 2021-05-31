require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buys_deliverys = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
      sleep 1
end

    describe '商品購入' do
         context '商品の購入ができる' do

           it '全ての情報があれば購入できる' do
            expect(@buys_deliverys).to be_valid
           end

           it '建物名が空でも登録できること' do
            expect(@buys_deliverys).to be_valid
          end
         end

        context '商品の購入ができない時' do

           it 'tokenが必須である' do
            @buys_deliverys.token = ''
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Token can't be blank")
           end

           it '郵便番号が必須である' do
              @buys_deliverys.post_number = ''
              @buys_deliverys.valid?
              expect(@buys_deliverys.errors.full_messages).to include("Post number can't be blank")
           end 
        
           it '郵便番号にはハイフンが必要である' do
            @buys_deliverys.post_number = '1111111'
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
           end
        
           it '郵便番号は半角数字のみ保存可能であること' do
            @buys_deliverys.post_number = ''
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
           end
         
           it '郵便番号は全角文字では登録できないこと' do
             @buys_deliverys.post_number = '０００−００００'
             @buys_deliverys.valid?
             expect(@buys_deliverys.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
           end

           it '都道府県が必須である' do
            @buys_deliverys.area_id = ''
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Area can't be blank")  
           end
      
           it '都道府県の情報が0では登録できない' do
            @buys_deliverys.area_id = 0
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Area can't be blank")
           end

           it '市区町村が必須である' do
            @buys_deliverys.city = ''
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("City can't be blank")
           end
 
           it '番地が必須である' do
            @buys_deliverys.address_number = ''
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Address number can't be blank")
           end

           it '電話番号が必須である' do
            @buys_deliverys.phone_number = ''
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number can't be blank")
           end

           it '電話番号にはハイフンが不要である' do
            @buys_deliverys.phone_number = '000-0000-0000'
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number is invalid.")
           end

           it '電話番号は9桁以下では登録できないこと' do
            @buys_deliverys.phone_number = '000000000'
           @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number is invalid.")
           end

           it '電話番号は12桁以上では登録できないこと' do
            @buys_deliverys.phone_number = '0000000000000'
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number is invalid.")
           end

           it '電話番号は半角数字のみ保存可能であること' do
            @buys_deliverys.phone_number = 'aaaaaaaaaaa'
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number is invalid.")
           end

           it '電話番号は全角文字では登録できないこと' do
            @buys_deliverys.phone_number = '１１１１１１１１１１１'
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number is invalid.")
           end

           it '電話番号は半角英数混合では登録できない' do
            @buys_deliverys.phone_number = '123abc'
            @buys_deliverys.valid?
            expect(@buys_deliverys.errors.full_messages).to include("Phone number is invalid.")
          end
        end
  end
end
