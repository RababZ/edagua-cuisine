class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :recipe_id, uniqueness: { scope: :user_id, message: "You've reviewed this recipe before." }
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5,
    message: 'Rating must be between 1 and 5'}
end
