# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSerializer
  include JSONAPI::Serializer
  # attributes
  attributes :id, :email, :created_at, :updated_at
end
