class Recipe < ApplicationRecord
  CATEGORIES = ['Plat', 'Dessert', 'Boisson']

  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  # validates :name, uniqueness: true, presence: true
  validates :category, inclusion: {
    in: %w[Plat Dessert Boisson],
    message: 'Please insert a valid category'
  }
  validates :difficulty, inclusion: {
    in: %w[Facile Moyen Difficile],
    message: 'Please insert a valid difficulty level'
  }

  validates :name, :category, :description,
            :active_time, :idle_time, :difficulty, :serving_size,
            presence: true

  accepts_nested_attributes_for :ingredients,
                                allow_destroy: true,
                                reject_if: :all_blank


  accepts_nested_attributes_for :steps,
                                allow_destroy: true,
                                reject_if: :all_blank

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
