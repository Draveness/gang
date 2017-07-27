FactoryGirl.define do
  factory :subtopic, class: 'Topics::Subtopic' do
    content { Faker::Lorem.sentence }
    topic
  end
end
