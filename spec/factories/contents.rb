# frozen_string_literal: true

# == Schema Information
#
# Table name: contents
#
#  id               :uuid             not null, primary key
#  purchasable_type :string
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
