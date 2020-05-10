class Step < ApplicationRecord
  belongs_to :recipe, optional: true
  # validates :recipe, uniqueness: { scope: :step }
  validates :description, presence: true
end
