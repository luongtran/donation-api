FactoryGirl.define do
  factory :booking do
    user factory: :user
    status 'new'
  end
end
