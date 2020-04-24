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

  def average_rating
    if self.reviews.size > 0
        self.reviews.average(:rating)
    else
        0
    end
    # ratings = []
    # self.reviews.each do |review|
    #   ratings << review.rating
    # end
    # if ratings.length > 0
    #   @reminder = ratings.sum.to_f % ratings.length
    #   @average_rating = (ratings.sum / ratings.length).to_i
    # else
    #   @average_rating = 0
    # end
  end
end
