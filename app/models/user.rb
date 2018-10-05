class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def favorited_book?(book)
    favorites.pluck(:book_id).include?(book.id)
  end
end
