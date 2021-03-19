# frozen_string_literal: true

class PurchaseOptionSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :price, :quality, :created_at, :updated_at, :content_id

  # relations
  belongs_to :content
end
