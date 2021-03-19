# frozen_string_literal: true

class SeasonSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :number, :plot, :title, :created_at, :updated_at

  # relations
  has_many :episodes
end
