# frozen_string_literal: true

class AddExpiresAtToPurchase < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :expires_at, :datetime
  end
end
