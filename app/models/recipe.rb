class Recipe < ApplicationRecord
  CATEGORIES = ['Dish', 'Dessert','Drink']

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  validates :name, uniqueness: true, presence: true
  validates :category, presence: true, inclusion: {
    in: %w[Dish Dessert Drink],
    message: 'Please insert a valid category'
  }
end
