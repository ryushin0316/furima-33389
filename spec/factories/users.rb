FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"鈴木"}
    first_name {"太朗"}
    family_name_ruby {"スズキ"}
    first_name_ruby {"タロウ"}
    birthday {"1945-07-04"}
  end
end