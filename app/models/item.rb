class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :delivery_pay

    #空の投稿を保存できないようにする
    validates :name, presence: true

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 0 } 

  belongs_to :user
  has_one :buy

  has_one_attached  :image
  
  validates :image, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :type_id, presence: true
  validates :delivery_pay_id, presence: true
  validates :area_id, presence: true
  validates :day_id, presence: true
  validates :price, presence: true, format: {with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


end
