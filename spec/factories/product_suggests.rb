FactoryGirl.define do
  factory :product_suggest do
    user_id 1
    category_id 1
    product_name Faker::Name.name
    description Faker::Lorem.paragraph
    image "slide1.jpg"
    created_at "12/12/2016"
  end
end
