require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { build(:book) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title).scoped_to(:author_id) }

  it { is_expected.to belong_to(:author) }

  describe 'instance methods' do
    let(:book) { create(:book) }
    let(:book_with_reviews) { create(:book, :with_reviews) }

    describe '#average_rating' do
      it '0 ratings' do
        expect(book.average_rating).to eq(0)
      end

      it 'some ratings' do
        expect(book_with_reviews.average_rating).to eq(2)
      end
    end

    it '#ratings_total' do
      expect(book_with_reviews.ratings_total).to eq(3)
    end

    it '#num_ratings' do
      expect(book_with_reviews.num_ratings).to eq(2)
    end

    it '#ratings' do
      expect(book_with_reviews.ratings).to include(1, 2)
    end
  end
end
