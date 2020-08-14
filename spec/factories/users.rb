FactoryBot.define do
  factory :user do
    nickname {"furima太郎123_-?@"}
    email {Faker::Internet.safe_email}
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password {password}
    password_confirmation {password}
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end