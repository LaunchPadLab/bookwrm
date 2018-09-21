class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :author }
end
