FactoryBot.define do
  factory :itemrecord_address do
    user_id         {1}
    item_id         {1}
    post_num        {'234-6789'}
    prefecture_id   {3}
    city            {'横浜市'}
    address         {'青葉333'}
    building        {'東京ハイツ'}
    phone           {'08011111111'}
  end
end