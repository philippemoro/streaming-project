# frozen_string_literal: true

FactoryBot.define do
  factory :content do
    purchasable { create(:movie) }

    trait :movie do
      purchasable { create(:movie) }
    end

    trait :season do
      purchasable { create(:season) }
    end

    factory :movie_content, traits: [:movie]
    factory :season_content, traits: [:season]
  end
end
