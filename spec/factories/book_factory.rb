FactoryGirl.define do
  factory :book do
    title Faker::Address.city
    price Faker::Commerce.price
    description Faker::Lorem.paragraph
  end
end
