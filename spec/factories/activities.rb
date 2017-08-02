FactoryGirl.define do
  factory :activity do
    time { Faker::Date.birthday(10,32) }
    content { Faker::Lorem.sentences }
    site # { Site.new }
    topic # { Topic.new }
  end
end
