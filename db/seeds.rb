# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



puts 'Cleaning database...'
Recipe.destroy_all

puts "Creating users.."

user = User.create(
  email: 'test@edaga.com',
  password: '123456',
  username: 'Test1'
  )

puts "Created #{user.email}"

puts 'Creating dish recipes...'
10.times do
  recipe = Recipe.create(
    name: Faker::Food.dish,
    category: 'Dish',
    user: user
  )
  puts "Created #{recipe.name}"
end

# puts 'Creating dessert recipes...'
# 10.times do
#   recipe = Recipe.create(
#     name: Faker::Dessert.variety,
#     category: 'dessert'
#   )
#   puts "Created #{recipe.name}"
# end

# puts 'Creating drink recipes...'
# 10.times do
#   recipe = Recipe.create(
#     name: Faker::Coffee.blend_name,
#     category: 'drink'
#   )
#   puts "Created #{recipe.name}"
# end

puts 'Creating ingredients...'

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

puts 'Created ingredients'
