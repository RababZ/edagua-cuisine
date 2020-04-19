class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5,
    message: 'Rating must be between 1 and 5'}
end
