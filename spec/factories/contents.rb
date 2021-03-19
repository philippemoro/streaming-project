# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id               :uuid             not null, primary key
#  plot             :string
#  purchasable_type :string
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  purchasable_id   :uuid
#
# Indexes
#
#  index_contents_on_purchasable_type_and_purchasable_id  (purchasable_type,purchasable_id)
#
FactoryBot.define do
  factory :content do
    title { Faker::Movie.title }
    plot { Faker::Lorem.paragraph }
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
