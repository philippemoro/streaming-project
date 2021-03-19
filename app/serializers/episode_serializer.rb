# frozen_string_literal: true

# == Schema Information
#
# Table name: episodes
#
#  id         :uuid             not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  season_id  :uuid
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (season_id => seasons.id)
#
class EpisodeSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :number, :plot, :title, :created_at, :updated_at, :season_id

  # relations
  belongs_to :season
end
