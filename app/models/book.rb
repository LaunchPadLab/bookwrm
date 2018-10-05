class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :author_id }

  def average_rating
    ratings_total / num_ratings
  end

  def ratings_total
    ratings = reviews.pluck(:rating)
    ratings.sum.to_f
  end

  def num_ratings
    ratings.size
  end
end
