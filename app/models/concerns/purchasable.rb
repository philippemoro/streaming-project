# frozen_string_literal: true

module Purchasable
  extend ActiveSupport::Concern

  included do
    has_one :content, as: :purchasable
  end
end
