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

tajine = Recipe.create!(
  user: user1,
  name: 'Tajine aux pruneaux',
  category: 'Plat',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.',
  active_time: '1h 30 min',
  idle_time: '_',
  difficulty: 'Facile',
  serving_size: 5,
  ingredients_attributes: [
    {
      quantity: "2",
      name: "tomates"
    },
    {
      quantity: "2",
      name: "oignons"
    }
  ],
  steps_attributes: [
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' },
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' },
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' }
  ]
)
puts "Created #{tajine.name}"

bastila = Recipe.create!(
  user: user1,
  name: 'Bastila au poisson',
  category: 'Plat',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.',
  active_time: '2h',
  idle_time: '_',
  difficulty: 'Moyen',
  serving_size: 6,
  ingredients_attributes: [
    {
      quantity: "1/2 kg",
      name: "crevettes"
    },
    {
      quantity: "1/4 kg",
      name: "calamar"
    },
    {
      quantity: "1/2 kg",
      name: "poisson blanc"
    }
  ],
  steps_attributes: [
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' },
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' },
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' }
  ]
)
puts "Created #{bastila.name}"

poulet_mhamer = Recipe.create!(
  user: user1,
  name: 'Poulet Mhamer',
  category: 'Plat',
  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.',
  active_time: '2h',
  idle_time: '_',
  difficulty: 'Moyen',
  serving_size: 5,
  ingredients_attributes: [
    {
      quantity: "1 kg",
      name: "poulet"
    },
    {
      quantity: "2",
      name: "oignons"
    },
    {
      quantity: "1 pincée",
      name: "sel"
    }
  ],
  steps_attributes: [
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' },
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' },
    { description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.' }
  ]
)
puts "Created #{poulet_mhamer.name}"

# 10.times do
#   recipe = Recipe.create!(
#     name: Faker::Food.dish,
#     category: 'Dish',
#     description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.',
#     user: user1
#   )
#   puts "Created #{recipe.name} #{recipe.user.email}"
# end

# puts 'Creating dessert recipes...'
# 10.times do
#   recipe = Recipe.create!(
#     name: Faker::Dessert.variety,
#     category: 'Dessert',
#     description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.',
#     user: user1
#   )
#   puts "Created #{recipe.name}"
# end

# puts 'Creating drink recipes...'
# 10.times do
#   recipe = Recipe.create!(
#     name: Faker::Coffee.blend_name,
#     category: 'Drink',
#     description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed semper orci vel quam lacinia, ultrices porttitor enim suscipit. Nulla viverra enim nec efficitur bibendum. Maecenas gravida malesuada arcu in ullamcorper.',
#     user: user1
#   )
#   puts "Created #{recipe.name}"
# end
