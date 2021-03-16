# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id                 :uuid             not null, primary key
#  expires_at         :datetime
#  price              :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  purchase_option_id :uuid
#  user_id            :uuid
#
# Indexes
#
#  index_purchases_on_purchase_option_id  (purchase_option_id)
#  index_purchases_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (purchase_option_id => purchase_options.id)
#
FactoryBot.define do
  factory :purchase do
    purchase_option
    user
    price { purchase_option.price }
    expires_at { 2.days.from_now }

    trait :expired do
      created_at { 5.days.ago }
      updated_at { 5.days.ago }
      expires_at { 3.days.ago }
    end

    factory :expired_purchase, traits: [:expired]
  end
end
