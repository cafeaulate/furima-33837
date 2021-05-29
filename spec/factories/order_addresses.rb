FactoryBot.define do
  factory :order_address do
    postal_code    { '999-9999' }
    prefecture_id   { 2 }
    manicipality  { '山形市' }
    address     { 'テスト1-1' }
    building    { 'テスト１' }
    phone      { '00000000000' }
    token     {"tok_abcdefghijk00000000000000000"}
  end
end
#