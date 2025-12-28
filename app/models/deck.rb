# frozen_string_literal: true

class Deck < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :delete_all

  validates :name, presence: true, uniqueness: { scope: :user_id }
end
