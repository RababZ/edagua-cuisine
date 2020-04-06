class Recipe < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :category, presence:true, inclusion: {
    in: %w[Dish Dessert Drink],
    message: 'Please insert a valid category'
  }
end
