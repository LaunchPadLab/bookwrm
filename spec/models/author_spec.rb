require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { build(:author) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
end
