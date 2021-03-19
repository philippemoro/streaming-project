# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :uuid             not null, primary key
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MovieSerializer
  include JSONAPI::Serializer

  # attributes
  attributes :id, :plot, :title, :created_at, :updated_at
end
