FactoryGirl.define do
  factory :city do
    name FFaker::AddressUS.city

    ignore do
      cars_count 3
    end

    after(:create) do |city, evaluator|
      create_list(:car, evaluator.cars_count, cities: [city])
    end
  end
end
