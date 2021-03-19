# frozen_string_literal: true

class EpisodeSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :number, :plot, :title, :created_at, :updated_at, :season_id

  # relations
  belongs_to :season
end
