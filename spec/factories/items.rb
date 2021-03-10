FactoryBot.define do
  factory :item do
    name {"商品"}
    info {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    delivery_pay_id {2}
    prefecture_id {2}
    delivery_date_id {2}
    price {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end

  end
end
