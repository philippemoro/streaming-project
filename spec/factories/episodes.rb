# frozen_string_literal: true

FactoryBot.define do
  factory :episode do
    season
    sequence(:title) { |n| "Episode-#{n}" }
    plot { Faker::Lorem.paragraph }
    sequence(:number)
  end
end
