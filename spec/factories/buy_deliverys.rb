FactoryBot.define do
  factory :buy_delivery do

    token { 'sample' } 
    post_number { '111-1111' }
    area_id { 1 }
    city { '市区町村' }
    address_number { '0-0-0' }
    building_name { }
    phone_number { 19012345678 }

    # association :user
    # association :item
    
  end
end
