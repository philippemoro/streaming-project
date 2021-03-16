# frozen_string_literal: true

class AddPriceToPurchase < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :price, :decimal, required: true
  end
end
