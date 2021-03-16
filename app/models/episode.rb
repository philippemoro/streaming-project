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
class Episode < ApplicationRecord
  belongs_to :season

  validates :number, presence: true, uniqueness: { scope: :season_id }
  validates :title, presence: true
end
