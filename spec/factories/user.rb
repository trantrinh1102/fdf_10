FactoryGirl.define do
  factory :user do |u|
    name "User"
    u.sequence(:email) { |n| "user#{n}@awesome.com"}
    password "12345678"
    role 1

    factory :admin do
      name "Admin"
      email "admin@mail.com"
      password "12345678"
      role 0
    end
  end
end
