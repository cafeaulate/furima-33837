FactoryBot.define do
  factory :item do
    product              { Faker::Lorem.sentence }
    text                 { Faker::Lorem.sentence }
    category_id          { 2 }
    charge_id            { 2 }
    prefecture_id        { 2 }
    span_id              { 2 }
    status_id            { 2 }
    price                { 3000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test.png'), filename: 'test.png')
    end
  end
end
