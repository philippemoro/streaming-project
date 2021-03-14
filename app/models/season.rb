# frozen_string_literal: true

class Season < ApplicationRecord
  include Purchasable
  has_many :episodes
end
