FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    f_name                { '太郎' }
    f_name_kana           { 'タロウ' }
    l_name                { '田中' }
    l_name_kana           { 'タナカ' }
    birthday              { '1995-07-20' }
  end
end
