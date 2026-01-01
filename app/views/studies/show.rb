# frozen_string_literal: true

module Views
  module Studies
    class Show < Views::Base
      attr_accessor :deck, :study

      def initialize(deck:, study:)
        super()
        self.deck = deck
        self.study = study
      end

      def view_template
        link_to("Back to Decks", decks_path)

        h1 { deck.name }

        card = study.next_card

        turbo_frame_tag("study") do
          h2 { card.front }

          study.possible_answers.each do |answer|
            ul do
              li do
                params = { answer: { answer:, card_id: card.id } }
                button_to(deck_study_path(deck), params:, method: :patch) do
                  answer
                end
              end
            end
          end
        end

        link_to("Back to Decks", decks_path)
      end
    end
  end
end
