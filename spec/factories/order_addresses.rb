FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_from_id { 2 }
    city { '東京都' }
    address_line { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end