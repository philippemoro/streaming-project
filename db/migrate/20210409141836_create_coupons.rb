# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons, id: :uuid do |t|
      t.references :user, type: :uuid, index: true
      t.references :purchase, type: :uuid, index: true
      t.string :code
      t.datetime :redeemed_at

      t.timestamps
    end
  end
end
