# frozen_string_literal: true

class ChangePurchaseOptionsReference < ActiveRecord::Migration[6.0]
  def change
    remove_reference :purchase_options, :purchasable, type: :uuid, index: true, polymorphic: true
    add_reference :purchase_options, :content, type: :uuid, index: true
  end
end
