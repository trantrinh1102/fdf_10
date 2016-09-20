FactoryGirl.define do
  factory :category do
    name Faker::Name.name
    description Faker::Lorem.paragraph
    created_at "12/12/2016"
  end
end
