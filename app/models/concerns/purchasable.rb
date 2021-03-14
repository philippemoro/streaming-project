# frozen_string_literal: true

module Purchasable
  extend ActiveSupport::Concern

  included do
    has_many :purchase_options, as: :purchasable
  end
end
