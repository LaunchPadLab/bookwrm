class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :author_id }

  scope :alphabetical, -> { order(title: :asc) }

  def average_rating
    return 0 if num_ratings.zero?
    (ratings_total / num_ratings).round(0)
  end

  def ratings_total
    ratings.sum.to_f
  end

  def num_ratings
    ratings.size
  end

  def ratings
    reviews.pluck(:rating)
  end
end
