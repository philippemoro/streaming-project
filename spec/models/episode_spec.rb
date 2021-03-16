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
require 'rails_helper'

describe Episode, type: :model do
  it { should belong_to(:season) }

  it { should validate_uniqueness_of(:number).scoped_to(:season_id) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:title) }
end
