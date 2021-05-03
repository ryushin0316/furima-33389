class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :buys
   has_many :items

   validates :nickname, presence: true
   validates :email, uniqueness: true

   with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角漢字・ひらがな・カタカナで入力して下さい" } do
     validates :family_name
     validates :first_name
   end

   with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナのみで入力して下さい" } do
     validates :family_name_ruby
     validates :first_name_ruby
   end

   validates :birthday, presence:true

   validates :password, format: { with: /\A(?=.*[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字混合で入力して下さい" }

   validates :password, confirmation: true

end
