FactoryGirl.define do
  factory :state do
    name FFaker::AddressUS.state

    ignore do
      cities_count 3
    end

    after(:create) do |state, evaluator|
      create_list(:city, evaluator.cities_count, state: state)
    end
  end
end
