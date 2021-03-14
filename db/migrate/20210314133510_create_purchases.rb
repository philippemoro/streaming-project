# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases, id: :uuid do |t|
      t.references :purchase_option, type: :uuid, index: true, foreign_key: true

      t.timestamps
    end
  end
end
