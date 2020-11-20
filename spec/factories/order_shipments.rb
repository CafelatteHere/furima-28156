FactoryBot.define do
  factory :order_shipment do
    zip_code       { "111-1111" }
    prefecture_id  { Faker::Number.between(from: 2, to: 47) }
    city           { 'city' }
    house_number   { '中野区4-5-6' }
    building_name  { '東ハイツ' }
    tel            { '12345678901' }
    token          {'aaa111' }
    user_id        { '1'}
    item_id        { 1 }
  end
end
