# frozen_string_literal: true

class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options, id: :uuid do |t|
      t.decimal :price
      t.string :quality

      t.references :purchasable, type: :uuid, index: true, polymorphic: true
      t.references :purchase, type: :uuid, index: true

      t.timestamps
    end
  end
end
