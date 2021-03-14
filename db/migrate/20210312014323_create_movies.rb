# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title
      t.string :plot

      t.timestamps
    end
  end
end