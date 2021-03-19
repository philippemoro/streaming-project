# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :email, :created_at, :updated_at
end
