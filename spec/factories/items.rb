FactoryBot.define do
  factory :item do
      name {"雑貨"}
      text {Faker::Lorem.sentence}
      category_id {"1"}
      type_id {"1"}
      delivery_pay_id {"1"}
      area_id {"1"}
      day_id {"1"}
      price {"500"}

      association :user

       after(:build) do |item|
        item.image.attach(io: File.open('public/images/testimage.png'), filename: 'testimage.png')
     end
  end
end
