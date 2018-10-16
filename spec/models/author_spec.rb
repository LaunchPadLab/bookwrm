require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { build(:author) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  describe 'instance methods' do
    let(:author) { create(:author, first_name: 'Jane', last_name: 'Smith') }

    it '#full_name' do
      expect(author.full_name).to eq('Jane Smith')
    end

    it '#reverse_name' do
      expect(author.reverse_name).to eq('Smith, Jane')
    end
  end
end
