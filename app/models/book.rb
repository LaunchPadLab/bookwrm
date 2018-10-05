class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :author_id }

  def average_rating
    reviews.pluck(:rating).reduce(:+).to_f / ratings.size
  end
end
