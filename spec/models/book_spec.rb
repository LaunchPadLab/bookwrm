require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { build(:book) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_uniqueness_of(:title).scoped_to(:author_id) }

  it { is_expected.to belong_to(:author) }
end
