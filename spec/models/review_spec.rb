require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { build(:review) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:rating) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:book) }
end
