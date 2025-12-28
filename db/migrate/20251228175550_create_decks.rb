# frozen_string_literal: true

class CreateDecks < ActiveRecord::Migration[8.1]
  def change
    create_table :decks do |table|
      table.string :name, null: false
      table.references :user, null: false, foreign_key: true, index: false
      table.timestamps
    end

    add_index :decks, [:user_id, :name], unique: true
  end
end
