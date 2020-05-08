class Step < ApplicationRecord
  belongs_to :recipe, optional: true
  # validates :recipe, uniqueness: { scope: :ingredient }
  validates :step_number, presence: true
  validates :description, presence: true
end
