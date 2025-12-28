# frozen_string_literal: true

require "rails_helper"

RSpec.describe Card do
  it { is_expected.to belong_to(:deck) }
  it { is_expected.to validate_inclusion_of(:status).in_array(Card::STATUSES) }
  it { is_expected.to validate_presence_of(:back) }
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:correct_count) }
  it { is_expected.to validate_presence_of(:correct_streak) }
  it { is_expected.to validate_presence_of(:deck_id) }
  it { is_expected.to validate_presence_of(:front) }
  it { is_expected.to validate_presence_of(:view_count) }

  it do
    create(:card, front: "Sample Front")

    expect(described_class.new)
      .to validate_uniqueness_of(:front).scoped_to(:deck_id)
  end
end
