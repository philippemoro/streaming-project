# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :movie do
    created_at { Time.zone.now }
  end
end
