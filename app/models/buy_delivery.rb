class BuyDelivery
  include ActiveModel::Model
  attr_accessor :number, :area_id, :post_number, :city, :address_number, :phone_number, :building_name, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
    validates :address_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}, length: { maximum: 11 }
    validates :token, presence: true
  end
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }


    def save
      Buy.create(item_id: item_id, user_id: user_id)
      Delivery.create(area_id: area_id, post_number: post_number, city: city, address_number: address_number, building_name: building_name, phone_number:phone_number)
    end

end