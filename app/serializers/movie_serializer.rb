# frozen_string_literal: true

class MovieSerializer
  include JSONAPI::Serializer

  # attributes
  attributes :id, :plot, :title, :created_at, :updated_at
end
