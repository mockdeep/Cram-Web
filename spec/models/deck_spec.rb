# frozen_string_literal: true

RSpec.describe Deck do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:cards).dependent(:delete_all) }

  it do
    create(:deck)

    expect(described_class.new)
      .to validate_uniqueness_of(:name).scoped_to(:user_id)
  end
end
