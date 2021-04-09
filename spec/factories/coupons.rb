# frozen_string_literal: true

# == Schema Information
#
# Table name: coupons
#
#  id          :uuid             not null, primary key
#  code        :string
#  redeemed_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  purchase_id :uuid
#  user_id     :uuid
#
# Indexes
#
#  index_coupons_on_purchase_id  (purchase_id)
#  index_coupons_on_user_id      (user_id)
#
FactoryBot.define do
  factory :coupon do
    code { Faker::Superhero.name }

    trait :redeemed do
      redeemed_at { 5.days.ago }
      user { create(:user) }
      purchase { create(:expired_purchase) }
    end

    factory :redeemed_coupon, traits: [:redeemed]
  end
end
