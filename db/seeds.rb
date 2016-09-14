@url="/app/assets/images/"

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
  avatar = File.open(File.join(Rails.root, @url+ "slide1.jpg"))
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               avatar: avatar)
end

puts "Create Category ....."

Category.create!(name: "Chiken", description: Faker::Lorem.paragraph)
Category.create!(name: "Tuna", description: Faker::Lorem.paragraph)


Category.create! name:"Food"
  10.times do |n|
  name  = Faker::Name.name
  description = Faker::Lorem.paragraph
  Category.create! name: name, description: description
end

puts "product ....."

3.times do |n|
  name  = Faker::Name.first_name
  price = 2000000
  quantity = 10
  category_id = Category.all.sample.id
  description = Faker::Lorem.paragraph
  image = File.open(File.join(Rails.root, @url+ "slide1.jpg"))
  Product.create!(name: name, category_id: category_id,
                  description: description, image: image,
                  price: price, quantity: quantity)
end

3.times do |n|
  name  = Faker::Name.first_name
  price = 3000000
  quantity = 10
  category_id = Category.all.sample.id
  description = Faker::Lorem.paragraph
  image = File.open(File.join(Rails.root, @url+ "slide2.jpg"))
  Product.create!(name: name, category_id: category_id,
                  description: description, image: image,
                  price: price, quantity: quantity)
end

3.times do |n|
  name  = Faker::Name.first_name
  price = 4000000
  quantity = 10
  category_id = Category.all.sample.id
  description = Faker::Lorem.paragraph
  image = File.open(File.join(Rails.root, @url+ "slide3.jpg"))
  Product.create!(name: name, category_id: category_id,
                  description: description, image: image,
                  price: price, quantity: quantity)
end

10.times do |n|
  name  = Faker::Name.first_name
  price = 5000000
  quantity = 10
  category_id = Category.all.sample.id
  description = Faker::Lorem.paragraph
  image = File.open(File.join(Rails.root, @url+ "slide1.jpg"))
  Product.create!(name: name, category_id: category_id,
                  description: description,
                  image: image, price: price, quantity: quantity)
end
