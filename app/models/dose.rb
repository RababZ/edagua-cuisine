class Dose < ApplicationRecord
  # belongs_to :ingredient
  belongs_to :recipe
  # validates :recipe, uniqueness: { scope: :ingredient }
  validates :description, presence: true
end
