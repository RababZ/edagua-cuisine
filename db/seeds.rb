require 'faker'


puts 'Cleaning database...'
Recipe.destroy_all

puts "Creating users.."
User.destroy_all

user1 = User.create(
  email: 'test@edaga.com',
  password: '123456',
  username: 'Test1'
  )

puts "Created #{user1.email}"

user2 = User.create(
  email: 'admin@edaga.com',
  password: '123456',
  username: 'Admin',
  admin: true
  )

puts "Created #{user2.email}"

puts 'Creating dish recipes...'
10.times do
  recipe = Recipe.create!(
    name: Faker::Food.dish,
    category: 'Dish',
    user: user1
  )
  puts "Created #{recipe.name} #{recipe.user.email}"
end

puts 'Creating dessert recipes...'
10.times do
  recipe = Recipe.create!(
    name: Faker::Dessert.variety,
    category: 'Dessert',
    user: user1
  )
  puts "Created #{recipe.name}"
end

puts 'Creating drink recipes...'
10.times do
  recipe = Recipe.create!(
    name: Faker::Coffee.blend_name,
    category: 'Drink',
    user: user1
  )
  puts "Created #{recipe.name}"
end
