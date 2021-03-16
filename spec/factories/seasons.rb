# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id         :uuid             not null, primary key
#  number     :integer
#  plot       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :season do
    sequence(:title) { |n| "Season-#{n}" }
    plot { Faker::Lorem.paragraph }
    sequence(:number)

    trait :with_episodes do
      after(:create) do |season|
        create_list(:episode, 3, season: season)
      end
    end
  end
end
