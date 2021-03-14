# frozen_string_literal: true

class PurchaseOption < ApplicationRecord
  belongs_to :purchasable, polymorphic: true
end
