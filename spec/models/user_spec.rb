require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to be_valid }

  describe 'instance methods' do
    let(:user) { create(:user, first_name: 'Jane', last_name: 'Smith') }
    let(:favorited_book) { create(:book) }
    let(:unfavorited_book) { create(:book) }

    it '#initials' do
      expect(user.initials).to eq('JS')
    end

    it '#full_name' do
      expect(user.full_name).to eq('Jane Smith')
    end

    describe '#favorited_book?' do
      it 'true' do
        FactoryBot.create(:favorite, user_id: user.id, book_id: favorited_book.id)
        expect(user.favorited_book?(favorited_book)).to be(true)
      end

      it 'false' do
        expect(user.favorited_book?(unfavorited_book)).to be(false)
      end
    end
  end
end
