# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |table|
      table.integer :correct_count, null: false, default: 0
      table.integer :correct_streak, null: false, default: 0
      table.integer :view_count, null: false, default: 0
      table.jsonb :wrong_answers, null: false, default: []
      table.references :deck, null: false, foreign_key: true, index: false
      table.string :back, null: false
      table.string :category, null: false
      table.string :front, null: false
      table.string :status, null: false
      table.timestamps
    end

    add_index :cards, [:deck_id, :front], unique: true
  end
end
