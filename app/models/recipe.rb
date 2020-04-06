class Recipe < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
