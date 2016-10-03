FactoryGirl.define do
  factory :auction do
    title { Faker::Commerce.product_name }
    details { Faker::Lorem.paragraph }
    reserve_price { rand(1000) }
    end_date { Time.now + rand(20).days }
    user_id { rand(100) }
  end
end
