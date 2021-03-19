# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons, id: :uuid do |t|
      t.integer :number

      t.timestamps
    end
  end
end
