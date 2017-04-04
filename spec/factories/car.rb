FactoryGirl.define do
  factory :car do
    brand FFaker::Vehicle.make
    model FFaker::Vehicle.model
    description FFaker::Lorem.sentences
    power { rand(1000) }
    type %w(sport luxury).sample
    engine FFaker::Vehicle.engine_cylinders
    seats { rand(7) }
  end
end
