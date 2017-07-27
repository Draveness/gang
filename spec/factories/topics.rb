FactoryGirl.define do
  factory :topic do
    name { Faker::Lorem.characters(10) }
    category

    after(:create) do |topic|
      create_list(:subtopic, 10, topic: topic)
    end
  end
end
