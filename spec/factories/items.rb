FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    shipping_fee_id { rand(2..3) }
    shipping_from_id { rand(2..48) }
    shipping_days_id { rand(2..4) }
    price { rand(300..9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open(('public/images/test_image.png')), filename: 'test_image.png')
    end
  end
end
