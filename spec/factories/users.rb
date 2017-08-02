# frozen_string_literal: true

FactoryGirl.define do
  factory :incompleted_user, class: User do
    avatar { Faker::Internet.url }
    nickname { Faker::Internet.user_name(2..10) }
    wechat { Faker::Internet.user_name(4..10) }
  end

  factory :user, parent: :incompleted_user do
    mobile { Faker::Number.number(11) }
    name { Faker::Name.name }
    gender :male
    school { Faker::Educator.university }
    grade 'Freshman'
    major { Faker::Educator.course }
    completed true
  end
end
