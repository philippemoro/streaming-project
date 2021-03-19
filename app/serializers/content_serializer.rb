# frozen_string_literal: true

class ContentSerializer
  include JSONAPI::Serializer

  # attributes
  attributes :id, :purchasable_type, :created_at, :updated_at, :purchasable_id

  # relations
  has_many :purchase_options
  belongs_to :purchasable, polymorphic: true
end
