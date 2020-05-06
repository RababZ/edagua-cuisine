class Ingredient < ApplicationRecord
  belongs_to :recipe
  # validates :recipe, uniqueness: { scope: :ingredient }
  validates :quantity, presence: true
  validates :name, presence: true
end
