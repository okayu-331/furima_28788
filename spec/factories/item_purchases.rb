FactoryBot.define do
  factory :item_purchase do
    postal_code { "123-4567" } 
    prefecture_id { Faker::Number.within(range: 1..47) }
    city { "テスト市" }
    address { "テスト町1-2ー３" }
    building { "テストビル1-2ー１０１" }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
    purchase_id { 1 }
    # association :user
    # association :item
  end
end
