puts "Create admin ....."

User.create!(name: "Admin",
  email: "admin@framgia.com",
  password: "12345678",
  password_confirmation: "12345678",
  role: 1)

puts "Create user...."

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@framgia.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
