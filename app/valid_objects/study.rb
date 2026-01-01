# frozen_string_literal: true

class Study
  attr_accessor :deck, :next_card

  def initialize(deck:)
    self.deck = deck
    self.next_card = deck.cards.sample
  end

  def possible_answers
    [*deck.cards.sample(4).map(&:back), next_card.back].shuffle
  end

  def answer_card(card_id:, answer:)
    card = deck.cards.find(card_id)
    correct = card.back == answer

    Result.new(correct:, correct_answer: card.back)
  end

  class Result
    attr_accessor :correct, :correct_answer

    def initialize(correct:, correct_answer:)
      self.correct = correct
      self.correct_answer = correct_answer
    end

    def correct?
      correct
    end
  end
end
