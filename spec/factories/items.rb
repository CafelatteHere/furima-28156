FactoryBot.define do
  factory :item do
    name               {Faker::Name.initials(number: 3)}
    description        {Faker::Lorem.sentence}
    category_id        {Faker::Number.between(from: 2, to: 13)}
    condition_id       {Faker::Number.between(from: 2, to: 7 )}
    shipment_type_id   {Faker::Number.between(from: 2, to: 3 )}
    area_id            {Faker::Number.between(from: 2, to: 48)}
    days_to_ship_id    {Faker::Number.between(from: 2, to: 4)}
    price              {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end