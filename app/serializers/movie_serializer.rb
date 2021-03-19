# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MovieSerializer
  include JSONAPI::Serializer

  # attributes
  attributes :id, :created_at, :updated_at
end
