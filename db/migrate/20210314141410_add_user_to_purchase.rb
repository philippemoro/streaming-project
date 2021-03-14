# frozen_string_literal: true

class AddUserToPurchase < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :user, type: :uuid, index: true
  end
end
