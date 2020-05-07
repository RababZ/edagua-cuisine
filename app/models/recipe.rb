class Recipe < ApplicationRecord
  CATEGORIES = ['Dish', 'Dessert','Drink']

  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  validates :name, presence: true
  # validates :name, uniqueness: true, presence: true
  validates :category, presence: true, inclusion: {
    in: %w[Dish Dessert Drink],
    message: 'Please insert a valid category'
  }

  accepts_nested_attributes_for :ingredients,
                                allow_destroy: true,
                                # reject_if: proc { |att| att['name'].blank? }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def average_rating
    if self.reviews.size > 0
        self.reviews.average(:rating)
    else
        0
    end
  end
end
