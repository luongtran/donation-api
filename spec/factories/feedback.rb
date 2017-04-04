FactoryGirl.define do
  factory :feedback do
    user factory: :user
    message FFaker::Lorem.paragraph
    rating { rand(6) }
  end
end
