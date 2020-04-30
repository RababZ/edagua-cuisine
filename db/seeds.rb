require 'faker'


puts 'Cleaning database...'
Recipe.destroy_all

puts "Creating users.."
User.destroy_all

user = User.create(
  email: 'test@edaga.com',
  password: '123456',
  username: 'Test1'
  )

puts "Created #{user.email}"

puts 'Creating dish recipes...'
10.times do
  recipe = Recipe.create!(
    name: Faker::Food.dish,
    category: 'Dish',
    user: user
  )
  puts "Created #{recipe.name} #{recipe.user.email}"
end

puts 'Creating dessert recipes...'
10.times do
  recipe = Recipe.create!(
    name: Faker::Dessert.variety,
    category: 'Dessert',
    user: user
  )
  puts "Created #{recipe.name}"
end

puts 'Creating drink recipes...'
10.times do
  recipe = Recipe.create!(
    name: Faker::Coffee.blend_name,
    category: 'Drink',
    user: user
  )
  puts "Created #{recipe.name}"
end

puts 'Creating ingredients...'

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

puts 'Created ingredients'
