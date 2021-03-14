# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    plot { Faker::Lorem.paragraph }
  end
end
