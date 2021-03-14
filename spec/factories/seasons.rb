# frozen_string_literal: true

FactoryBot.define do
  factory :season do
    sequence(:title) { |n| "Season-#{n}" }
    plot { Faker::Lorem.paragraph }
    sequence(:number)
  end
end
