# frozen_string_literal: true

class Content < ApplicationRecord
  has_many :purchase_options
  belongs_to :purchasable, polymorphic: true
end
