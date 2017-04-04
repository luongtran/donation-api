FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    surname { FFaker::Name.first_name }
    email { FFaker::Internet.email }
    trait :admin do
      role 'admin'
    end
    trait :user do
      role 'user'
    end
    trait :customer do
      role 'customer'
    end
    trait :confirmed do
      confirmed_at { Time.now }
    end
    password 123456
  end
end
