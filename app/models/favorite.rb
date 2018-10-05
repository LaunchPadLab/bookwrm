class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.for_book(book)
    find_by(book_id: book.id)
  end
end
