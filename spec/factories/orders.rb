FactoryBot.define do
  factory :order do

    association :user
    association :item
    item_id {:item.id}
     user_id {:user.id}
  end
end
