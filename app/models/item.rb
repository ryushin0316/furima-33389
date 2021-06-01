class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :type
  belongs_to :delivery_pay
  belongs_to :area
  belongs_to :day

  # 空の投稿を保存できないようにする
  validates :name, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :type_id
    validates :delivery_pay_id
    validates :area_id
    validates :day_id
  end

  has_one_attached :image
  belongs_to :user
  has_one :buy

  with_options presence: true do
    validates :name
    validates :image
    validates :text
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
