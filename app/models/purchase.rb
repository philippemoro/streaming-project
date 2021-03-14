# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :user
  has_one :purchase_option
end
