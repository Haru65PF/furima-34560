FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"太郎"}
    first_name {"鈴木"}
    base_last_name {"タロウ"}
    base_first_name {"スズキ"}
    birth_date {Faker::Date.in_date_period}
  end
end