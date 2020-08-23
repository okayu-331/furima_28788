FactoryBot.define do
  factory :item do
    name { "アイテムの名前-sample123/" } 
    description { "説明のテキスト-sample123/" }
    category_id { Faker::Number.within(range: 1..10) }
    status_id { Faker::Number.within(range: 1..6) }
    shipping_fee_id { Faker::Number.within(range: 1..2) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    shipping_days_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9999999) }
    association :user
  end
end
