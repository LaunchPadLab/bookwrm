class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :content
end
