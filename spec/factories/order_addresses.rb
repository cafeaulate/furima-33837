FactoryBot.define do
  factory :order_address do
    postal_code    { '999-9999' }
    prefecture_id   { 2 }
    manicipality  { '山形市' }
    address     { 'テスト1-1' }
    building    { nil }
    phone      { '00000000000' }
    user_id    {2}
    item_id    {2}
  end
end
#