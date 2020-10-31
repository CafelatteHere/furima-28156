FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 3)}
    email                  {Faker::Internet.free_email}
    password               {"12345a"}
    password_confirmation  {password}
    surname                {"田中"}
    name                   {"一郎"}
    surname_furigana       {"タナカ"}
    name_furigana          {"イチロウ"}
    birthday               {"1930-01-01"}
  end
end