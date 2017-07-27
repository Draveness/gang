FactoryGirl.define do
  factory :site do
    name { Faker::Educator.university }
    image { Faker::Internet.url }
    longitude { Faker::Number.decimal(2, 6) }
    latitude { Faker::Number.decimal(2, 6) }
  end
end
