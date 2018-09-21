require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject { build(:favorite) }

  it { is_expected.to be_valid }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:book) }
end
