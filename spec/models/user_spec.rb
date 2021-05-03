require 'rails_helper'

RSpec.describe User, type: :model do
    before do 
      @user = FactoryBot.build(:user)
    end

  describe "新規登録/ユーザー情報" do

    context 'ユーザーの新規登録ができる時' do
      it '全ての情報があれば保存できる' do
        expect(@user).to be_valid
      end
    end
  
    context 'ユーザーの新規登録ができない時' do
    it 'nicknameが必須である' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須である' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスは、@を含む必要がある' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailでは登録できないこと'do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'パスワードが必須である' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力して下さい")
    end
    it 'パスワードは、英語のみでは登録できないこと' do
      @user.password = '222222'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力して下さい")
    end

    it '全角では登録できないこと' do
      @user.password = '１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力して下さい")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password = "000000"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名は、名字が必須である" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名は、名前が必須である" do
      @user.first_name =  ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角漢字・ひらがな・カタカナで入力して下さい")
    end
    it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角漢字・ひらがな・カタカナで入力して下さい")
    end
    it "ユーザー本名の名字のフリガナは必須であること" do
      @user.family_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name ruby can't be blank")
    end
    it "ユーザー本名の名前のフリガナは必須であること" do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end
    it "ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.family_name_ruby = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name ruby 全角カタカナのみで入力して下さい")
    end
    it "ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_ruby = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby 全角カタカナのみで入力して下さい")
    end
    it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
