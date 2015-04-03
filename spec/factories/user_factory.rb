FactoryGirl.define do
  factory :admin, class: User do
    email Faker::Internet.email
    password Faker::Internet.password
    admin true
  end

  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    admin false
  end
end
