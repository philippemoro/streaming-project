# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  delegate :purchasable, to: :purchase_option, allow_nil: false
end
