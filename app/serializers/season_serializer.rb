# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id         :uuid             not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SeasonSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :number, :plot, :title, :created_at, :updated_at

  # relations
  has_many :episodes
end
