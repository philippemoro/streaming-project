# frozen_string_literal: true

class PurchaseSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :price, :expires_at, :created_at, :updated_at, :user_id, :purchase_option_id

  # relations
  belongs_to :user
  belongs_to :purchase_option
end
